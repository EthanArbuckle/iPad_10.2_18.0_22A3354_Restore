@implementation MLPLSTMLayer

- (MLPLSTMLayer)initWithName:(id)a3 inputSize:(unint64_t)a4 outputSize:(unint64_t)a5 weightAttributes:(unint64_t)a6
{
  id v10;
  MLPLSTMLayer *v11;
  const char *v12;
  uint64_t v13;
  MLPLSTMLayer *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  objc_super v38;

  v10 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MLPLSTMLayer;
  v11 = -[MLPLayer initWithLayerType:name:neuronType:neuronParams:](&v38, sel_initWithLayerType_name_neuronType_neuronParams_, 8, v10, 0, 0);
  v14 = v11;
  if (v11)
  {
    objc_msgSend_setInputLength_(v11, v12, 1, v13);
    objc_msgSend_setInputSize_(v14, v15, a4, v16);
    objc_msgSend_setOutputLength_(v14, v17, 1, v18);
    objc_msgSend_setOutputSize_(v14, v19, a5, v20);
    objc_msgSend_setInputChannels_(v14, v21, a4, v22);
    objc_msgSend_setOutputChannels_(v14, v23, a5, v24);
    objc_msgSend_setWeightAttributes_(v14, v25, a6, v26);
    objc_msgSend_setInputGateActivation_(v14, v27, 3, v28);
    objc_msgSend_setForgetGateActivation_(v14, v29, 3, v30);
    objc_msgSend_setCellGateActivation_(v14, v31, 5, v32);
    objc_msgSend_setOutputGateActivation_(v14, v33, 3, v34);
    objc_msgSend_setCellToOutputActivation_(v14, v35, 5, v36);
  }

  return v14;
}

- (MLPLSTMLayer)initWithName:(id)a3 parameters:(id *)a4
{
  id v6;
  const char *v7;
  MLPLSTMLayer *v8;
  const char *v9;
  uint64_t v10;
  MLPLSTMLayer *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;

  v6 = a3;
  v8 = (MLPLSTMLayer *)objc_msgSend_initWithName_inputSize_outputSize_weightAttributes_(self, v7, (uint64_t)v6, a4->var9[0][0], a4->var10[0][0], a4->var8);
  v11 = v8;
  if (v8)
  {
    objc_msgSend_setInitialWeights_0_(v8, v9, (uint64_t)a4->var13[0], v10);
    objc_msgSend_setInitialWeights_1_(v11, v12, (uint64_t)a4->var13[1], v13);
    objc_msgSend_setInitialBias_0_(v11, v14, (uint64_t)a4->var14[0], v15);
    objc_msgSend_setInitialBias_1_(v11, v16, (uint64_t)a4->var14[1], v17);
    objc_msgSend_populateActivation_montrealActivationType_(v11, v18, (uint64_t)&v11->_inputGateActivation, a4->var7[0]);
    objc_msgSend_populateActivation_montrealActivationType_(v11, v19, (uint64_t)&v11->_forgetGateActivation, a4->var7[1]);
    objc_msgSend_populateActivation_montrealActivationType_(v11, v20, (uint64_t)&v11->_cellGateActivation, a4->var7[2]);
    objc_msgSend_populateActivation_montrealActivationType_(v11, v21, (uint64_t)&v11->_outputGateActivation, a4->var7[3]);
    objc_msgSend_populateActivation_montrealActivationType_(v11, v22, (uint64_t)&v11->_cellToOutputActivation, a4->var7[4]);
  }

  return v11;
}

- (void)populateActivation:(int *)a3 montrealActivationType:(int64_t)a4
{
  if (a4)
    *a3 = objc_msgSend_mpsNeuronTypeFromMontrealType_(self, a2, a4, a4);
}

- (void)createKernel
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  id v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  id v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  id v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  unint64_t i;
  void *v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  id v260;
  id v261;
  const char *v262;
  void *v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  void *v267;
  const char *v268;
  uint64_t v269;
  void *v270;
  void *v271;
  _QWORD v272[4];
  id v273;
  id v274;
  unint64_t v275;
  _QWORD v276[4];
  id v277;
  id v278;
  unint64_t v279;
  _QWORD v280[5];
  _QWORD v281[4];
  id v282;
  MLPLSTMLayer *v283;
  MLPLSTMLayer **v284;
  MLPLSTMLayer *v285;

  v285 = self;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOptimizers_(self, v6, (uint64_t)v5, v7);

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWeights_(self, v12, (uint64_t)v11, v13);

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWeightGradients_(v285, v18, (uint64_t)v17, v19);

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTrainingStates_(v285, v24, (uint64_t)v23, v25);

  objc_msgSend_network(v285, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v33, v34, v35, v36);
  v37 = objc_claimAutoreleasedReturnValue();

  v284 = &v285;
  v38 = (void *)MEMORY[0x1E0CC6ED0];
  v42 = objc_msgSend_inputSize(v285, v39, v40, v41);
  v46 = objc_msgSend_outputSize(v285, v43, v44, v45);
  objc_msgSend_createLSTMDescriptorWithInputFeatureChannels_outputFeatureChannels_(v38, v47, v42, v46);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLstmDesc_(v285, v49, (uint64_t)v48, v50);

  v54 = objc_msgSend_inputGateActivation(v285, v51, v52, v53);
  v58 = objc_msgSend_inputSize(v285, v55, v56, v57);
  v62 = objc_msgSend_outputSize(v285, v59, v60, v61);
  sub_19C23ECE8((void ***)&v284, 3, v54, v58, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lstmDesc(v285, v64, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInputGateInputWeights_(v67, v68, (uint64_t)v63, v69);

  v73 = objc_msgSend_outputSize(v285, v70, v71, v72);
  v77 = objc_msgSend_outputSize(v285, v74, v75, v76);
  sub_19C23ECE8((void ***)&v284, 4, 0, v73, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lstmDesc(v285, v79, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInputGateRecurrentWeights_(v82, v83, (uint64_t)v78, v84);

  v88 = objc_msgSend_forgetGateActivation(v285, v85, v86, v87);
  v92 = objc_msgSend_inputSize(v285, v89, v90, v91);
  v96 = objc_msgSend_outputSize(v285, v93, v94, v95);
  sub_19C23ECE8((void ***)&v284, 7, v88, v92, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lstmDesc(v285, v98, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setForgetGateInputWeights_(v101, v102, (uint64_t)v97, v103);

  v107 = objc_msgSend_outputSize(v285, v104, v105, v106);
  v111 = objc_msgSend_outputSize(v285, v108, v109, v110);
  sub_19C23ECE8((void ***)&v284, 8, 0, v107, v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lstmDesc(v285, v113, v114, v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setForgetGateRecurrentWeights_(v116, v117, (uint64_t)v112, v118);

  v122 = objc_msgSend_cellGateActivation(v285, v119, v120, v121);
  v126 = objc_msgSend_inputSize(v285, v123, v124, v125);
  v130 = objc_msgSend_outputSize(v285, v127, v128, v129);
  sub_19C23ECE8((void ***)&v284, 11, v122, v126, v130);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lstmDesc(v285, v132, v133, v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCellGateInputWeights_(v135, v136, (uint64_t)v131, v137);

  v141 = objc_msgSend_outputSize(v285, v138, v139, v140);
  v145 = objc_msgSend_outputSize(v285, v142, v143, v144);
  sub_19C23ECE8((void ***)&v284, 12, 0, v141, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lstmDesc(v285, v147, v148, v149);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCellGateRecurrentWeights_(v150, v151, (uint64_t)v146, v152);

  v156 = objc_msgSend_outputGateActivation(v285, v153, v154, v155);
  v160 = objc_msgSend_inputSize(v285, v157, v158, v159);
  v164 = objc_msgSend_outputSize(v285, v161, v162, v163);
  sub_19C23ECE8((void ***)&v284, 15, v156, v160, v164);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lstmDesc(v285, v166, v167, v168);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOutputGateInputWeights_(v169, v170, (uint64_t)v165, v171);

  v175 = objc_msgSend_outputSize(v285, v172, v173, v174);
  v179 = objc_msgSend_outputSize(v285, v176, v177, v178);
  sub_19C23ECE8((void ***)&v284, 16, 0, v175, v179);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lstmDesc(v285, v181, v182, v183);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOutputGateRecurrentWeights_(v184, v185, (uint64_t)v180, v186);

  v190 = objc_msgSend_cellToOutputActivation(v285, v187, v188, v189);
  objc_msgSend_lstmDesc(v285, v191, v192, v193);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCellToOutputNeuronType_(v194, v195, v190, v196);

  objc_msgSend_lstmDesc(v285, v197, v198, v199);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUseFloat32Weights_(v200, v201, 1, v202);

  v203 = objc_alloc(MEMORY[0x1E0CC7228]);
  objc_msgSend_lstmDesc(v285, v204, v205, v206);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weights(v285, v208, v209, v210);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v213 = (void *)objc_msgSend_initWithDevice_rnnDescriptor_trainableWeights_(v203, v212, v37, (uint64_t)v207, v211);
  objc_msgSend_setFilter_(v285, v214, (uint64_t)v213, v215);

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v216, v217, v218);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v220, v221, v222);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filter(v285, v224, v225, v226);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createWeightMatrices_(v227, v228, (uint64_t)v219, v229);

  v230 = MEMORY[0x1E0C809B0];
  v281[0] = MEMORY[0x1E0C809B0];
  v281[1] = 3221225472;
  v281[2] = sub_19C23EE50;
  v281[3] = &unk_1E3D25830;
  v231 = v223;
  v282 = v231;
  v283 = v285;
  v271 = (void *)MEMORY[0x1A1AD22D4](v281);
  objc_msgSend_filter(v285, v232, v233, v234);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weightGradients(v285, v236, v237, v238);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createWeightGradientMatrices_dataType_(v235, v240, (uint64_t)v239, 268435488);

  v241 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v245 = objc_msgSend_count(v219, v242, v243, v244);
  v248 = (void *)objc_msgSend_initWithCapacity_(v241, v246, v245, v247);
  v270 = (void *)v37;
  objc_msgSend_setOptimizers_(v285, v249, (uint64_t)v248, v250, v223);

  for (i = 0; i < objc_msgSend_count(v219, v251, v252, v253); ++i)
  {
    v280[0] = v230;
    v280[1] = 3221225472;
    v280[2] = sub_19C23EEB8;
    v280[3] = &unk_1E3D25858;
    v280[4] = v285;
    v255 = (void *)MEMORY[0x1A1AD22D4](v280);
    objc_msgSend_network(v285, v256, v257, v258);
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    v276[0] = v230;
    v276[1] = 3221225472;
    v276[2] = sub_19C23EFCC;
    v276[3] = &unk_1E3D25880;
    v260 = v255;
    v278 = v260;
    v277 = v219;
    v279 = i;
    v272[0] = v230;
    v272[1] = 3221225472;
    v272[2] = sub_19C23EFE0;
    v272[3] = &unk_1E3D258A8;
    v273 = v271;
    v261 = v260;
    v274 = v261;
    v275 = i;
    objc_msgSend_optimizerWithNetwork_momentum_velocity_(MLPOptimizer, v262, (uint64_t)v259, (uint64_t)v276, v272);
    v263 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_optimizers(v285, v264, v265, v266);
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v267, v268, (uint64_t)v263, v269);

  }
}

- (id)seqForward:(id)a3 input:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char isKindOfClass;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  MPSStateBatch *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  objc_msgSend_updateSourceMatrix_inference_(self, v11, (uint64_t)v10, v6);
  objc_msgSend_trainingStates(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v15, v16, v17, v18);

  objc_msgSend_nextLayer(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    objc_msgSend_seqForwardDifferentMatrices_input_(self, v24, (uint64_t)v9, (uint64_t)v10);
  else
    objc_msgSend_seqForwardCombinedMatrix_input_(self, v24, (uint64_t)v9, (uint64_t)v10);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_trainingStates(self, v25, v26, v27);
    v29 = (MPSStateBatch *)objc_claimAutoreleasedReturnValue();
    MPSStateBatchIncrementReadCount(v29, -1);

    objc_msgSend_trainingStates(self, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeAllObjects(v33, v34, v35, v36);

  }
  return v28;
}

- (id)seqForwardDifferentMatrices:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DE8];
  v72 = v7;
  v12 = objc_msgSend_count(v7, v9, v10, v11);
  objc_msgSend_arrayWithCapacity_(v8, v13, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_network(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v23, v24, v25, v26);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v27 = v72;
  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v73, (uint64_t)v77, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v74;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v74 != v33)
          objc_enumerationMutation(v27);
        v35 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v34);
        objc_msgSend_network(self, v29, v30, v31, v71);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_deviceHandler(v36, v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend_rows(v35, v41, v42, v43);
        v48 = objc_msgSend_outputSize(self, v45, v46, v47);
        objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v40, v49, v44, v48, v6);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_addObject_(v15, v51, (uint64_t)v50, v52);
        ++v34;
      }
      while (v32 != v34);
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v73, (uint64_t)v77, 16);
    }
    while (v32);
  }

  objc_msgSend_filter(self, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trainingStates(self, v57, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weights(self, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeForwardSequenceToCommandBuffer_sourceMatrices_destinationMatrices_trainingStates_weights_(v56, v65, (uint64_t)v6, (uint64_t)v27, v15, v60, v64);

  v69 = (void *)objc_msgSend_copy(v15, v66, v67, v68);
  return v69;
}

- (id)seqForwardCombinedMatrix:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t i;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  size_t v58;
  void *v59;
  uint64_t v60;
  unint64_t j;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  const char *v84;
  void *v85;
  void *__p;
  _QWORD v88[2];

  v88[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DE8];
  v12 = objc_msgSend_count(v7, v9, v10, v11);
  objc_msgSend_arrayWithCapacity_(v8, v13, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_network(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0;
  for (i = 0; i < objc_msgSend_count(v7, v28, v29, v30); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v7, v33, i, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v31 += objc_msgSend_rows(v36, v37, v38, v39);

  }
  objc_msgSend_network(self, v33, v34, v35);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend_outputSize(self, v45, v46, v47);
  objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v44, v49, v31, v48, v6);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = objc_msgSend_count(v7, v51, v52, v53);
  __p = 0;
  if (v54)
  {
    if (v54 >> 61)
      sub_19C07DA0C();
    v58 = 8 * v54;
    v59 = operator new(8 * v54);
    __p = v59;
    bzero(v59, v58);
  }
  else
  {
    v59 = 0;
  }
  v60 = 0;
  for (j = 0; j < objc_msgSend_count(v7, v55, v56, v57); ++j)
  {
    objc_msgSend_addObject_(v15, v62, (uint64_t)v50, v64);
    *((_QWORD *)v59 + j) = objc_msgSend_rowBytes(v50, v65, v66, v67) * v60;
    objc_msgSend_objectAtIndexedSubscript_(v7, v68, j, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v60 += objc_msgSend_rows(v70, v71, v72, v73);

  }
  objc_msgSend_filter(self, v62, v63, v64);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trainingStates(self, v75, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weights(self, v79, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeForwardSequenceToCommandBuffer_sourceMatrices_sourceOffsets_destinationMatrices_destinationOffsets_trainingStates_recurrentInputState_recurrentOutputStates_weights_(v74, v83, (uint64_t)v6, (uint64_t)v7, 0, v15, v59, v78, 0, 0, v82);

  v88[0] = v50;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v84, (uint64_t)v88, 1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
    operator delete(__p);

  return v85;
}

- (id)seqBackward:(id)a3 dataBatch:(id)a4 inputGradient:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t i;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_nextLayer(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    objc_msgSend_seqBackwardDifferentMatrices_inputGradient_(self, v16, (uint64_t)v8, (uint64_t)v10);
  else
    objc_msgSend_seqBackwardCombinedMatrix_inputGradient_(self, v16, (uint64_t)v8, (uint64_t)v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend_weights(self, v17, v18, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (i >= v26)
      break;
    objc_msgSend_weights(self, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v30, v31, i, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_weightGradients(self, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v37, v38, i, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_optimizers(self, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v44, v45, i, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_encodeToCommandBuffer_inputGradientMatrix_inputValuesMatrix_(v47, v48, (uint64_t)v8, (uint64_t)v40, v33);
  }

  return v20;
}

- (id)seqBackwardDifferentMatrices:(id)a3 inputGradient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DE8];
  v76 = v7;
  v12 = objc_msgSend_count(v7, v9, v10, v11);
  objc_msgSend_arrayWithCapacity_(v8, v13, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_network(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v23, v24, v25, v26);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v27 = v76;
  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v77, (uint64_t)v81, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v78;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v78 != v33)
          objc_enumerationMutation(v27);
        v35 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v34);
        objc_msgSend_network(self, v29, v30, v31);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_deviceHandler(v36, v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend_rows(v35, v41, v42, v43);
        v48 = objc_msgSend_inputSize(self, v45, v46, v47);
        objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v40, v49, v44, v48, v6);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_addObject_(v15, v51, (uint64_t)v50, v52);
        ++v34;
      }
      while (v32 != v34);
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v77, (uint64_t)v81, 16);
    }
    while (v32);
  }

  objc_msgSend_filter(self, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_srcMatrices(self, v57, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weightGradients(self, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trainingStates(self, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weights(self, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeGradientSequenceToCommandBuffer_forwardSources_sourceGradients_destinationGradients_weightGradients_trainingStates_weights_(v56, v73, (uint64_t)v6, (uint64_t)v60, v27, v15, v64, v68, v72);

  return v15;
}

- (id)seqBackwardCombinedMatrix:(id)a3 inputGradient:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  size_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t i;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  id v105;
  const char *v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  void *v159;
  void *v160;
  void *v161;
  id v162;
  id v163;
  void *v164;
  void *__p;
  void *v166;
  void *v167;
  uint64_t v168;

  v163 = a3;
  v6 = a4;
  objc_msgSend_objectAtIndexedSubscript_(v6, v7, 0, v8);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_srcMatrices(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_count(v13, v14, v15, v16);
  objc_msgSend_arrayWithCapacity_(v9, v18, v17, v19);
  v164 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_srcMatrices(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_count(v24, v25, v26, v27);
  objc_msgSend_arrayWithCapacity_(v20, v29, v28, v30);
  v162 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_network(self, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v38, v39, v40, v41);
  v160 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_srcMatrices(self, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend_count(v45, v46, v47, v48);
  if (v49)
  {
    if (v49 >> 61)
      sub_19C07DA0C();
    v50 = 8 * v49;
    __p = operator new(8 * v49);
    bzero(__p, v50);
  }
  else
  {
    __p = 0;
  }

  v51 = (void *)MEMORY[0x1E0CC6F00];
  v55 = objc_msgSend_columns(v166, v52, v53, v54);
  v59 = objc_msgSend_rowBytes(v166, v56, v57, v58);
  v63 = objc_msgSend_dataType(v166, v60, v61, v62);
  objc_msgSend_matrixDescriptorWithRows_columns_rowBytes_dataType_(v51, v64, 1, v55, v59, v63);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = v6;
  objc_msgSend_data(v166, v65, v66, v67);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = 0;
  for (i = 0; ; ++i)
  {
    objc_msgSend_srcMatrices(self, v68, v69, v70);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend_count(v72, v73, v74, v75);

    if (i >= v76)
      break;
    *((_QWORD *)__p + i) = v168;
    objc_msgSend_srcMatrices(self, v77, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v80, v81, i, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend_rows(v83, v84, v85, v86);
    v91 = objc_msgSend_rowBytes(v166, v88, v89, v90);

    objc_msgSend_srcMatrices(self, v92, v93, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v95, v96, i, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend_rows(v98, v99, v100, v101);
    objc_msgSend_setRows_(v167, v103, v102, v104);

    v105 = objc_alloc(MEMORY[0x1E0CC6ED8]);
    v107 = (void *)objc_msgSend_initWithBuffer_descriptor_(v105, v106, (uint64_t)v161, (uint64_t)v167);
    objc_msgSend_addObject_(v164, v108, (uint64_t)v107, v109);
    objc_msgSend_network(self, v110, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceHandler(v113, v114, v115, v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_srcMatrices(self, v118, v119, v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v121, v122, i, v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = objc_msgSend_rows(v124, v125, v126, v127);
    v132 = objc_msgSend_inputSize(self, v129, v130, v131);
    objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v117, v133, v128, v132, v163);
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObject_(v162, v135, (uint64_t)v134, v136);
    v168 += v91 * v87;

  }
  objc_msgSend_filter(self, v77, v78, v79);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_srcMatrices(self, v138, v139, v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weightGradients(self, v142, v143, v144);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trainingStates(self, v146, v147, v148);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weights(self, v150, v151, v152);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeGradientSequenceToCommandBuffer_forwardSources_forwardSourceOffsets_sourceGradients_sourceGradientOffsets_destinationGradients_destinationOffsets_weightGradients_trainingStates_recurrentInputState_recurrentOutputStates_weights_(v137, v154, (uint64_t)v163, (uint64_t)v141, 0, v164, __p, v162, 0, v145, v149, 0, 0, v153);

  objc_msgSend_decrementReadCount(v166, v155, v156, v157);
  if (__p)
    operator delete(__p);

  return v162;
}

- (void)updateSourceMatrix:(id)a3 inference:(BOOL)a4
{
  const char *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if (!a4)
  {
    sub_19C239224(v8);
    objc_msgSend_setSrcMatrices_(self, v6, (uint64_t)v8, v7);
  }

}

- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  MLPLSTMLayer *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  MLPLSTMLayer *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  MLPLSTMLayer *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  MLPLSTMLayer *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  MLPLSTMLayer *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t i;
  void *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  void *v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t j;
  void *v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  void *v127;
  const char *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t k;
  void *v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  void *v146;
  const char *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t ii;
  void *v180;
  MLPLSTMLayer *v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t jj;
  void *v194;
  MLPLSTMLayer *v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t m;
  void *v219;
  MLPLSTMLayer *v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t n;
  void *v230;
  MLPLSTMLayer *v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  size_t v239;
  void *v240;
  const char *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t kk;
  void *v248;
  void *v249;
  MLPLSTMLayer *v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  const char *v255;
  void *v256;
  uint64_t v257;
  const char *v258;
  uint64_t v259;
  void *v260;
  const char *v261;
  void *v262;
  const char *v263;
  void *v264;
  void *v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  const char *v270;
  uint64_t v271;
  void *v272;
  const char *v273;
  void *v274;
  const char *v275;
  void *v276;
  const char *v277;
  void *v278;
  unint64_t *v280;
  void *v281;
  void *v282;
  id v283;
  id v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  _QWORD v317[2];
  _QWORD v318[16];
  int v319;
  int v320;
  uint64_t v321;
  uint64_t v322;
  void *v323;
  void *v324;
  MLPLSTMLayer *v325;
  _QWORD v326[3];
  void *v327;
  _QWORD v328[3];
  void *v329;
  _BYTE v330[128];
  _BYTE v331[128];
  _BYTE v332[128];
  _BYTE v333[128];
  _BYTE v334[128];
  _BYTE v335[128];
  _BYTE v336[128];
  _BYTE v337[128];
  uint64_t v338;

  v338 = *MEMORY[0x1E0C80C00];
  v325 = self;
  v283 = a3;
  v284 = a4;
  objc_msgSend_network(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v15, v16, v17, v18);
  v281 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_network(v325, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandQueue(v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v282 = v30;
  objc_msgSend_commandBuffer(v30, v31, v32, v33);
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  bzero(v318, 0x2C0uLL);
  v318[5] = 0;
  v318[4] = 0;
  v318[0] = 5;
  v318[15] = objc_msgSend_weightAttributes(v325, v34, v35, v36) | 0x80;
  v37 = v325;
  v41 = objc_msgSend_inputGateActivation(v325, v38, v39, v40);
  v318[7] = objc_msgSend_montrealTypeFromMPSNeuronType_(v37, v42, v41, v43);
  v44 = v325;
  v48 = objc_msgSend_forgetGateActivation(v325, v45, v46, v47);
  v318[8] = objc_msgSend_montrealTypeFromMPSNeuronType_(v44, v49, v48, v50);
  v51 = v325;
  v55 = objc_msgSend_cellGateActivation(v325, v52, v53, v54);
  v318[9] = objc_msgSend_montrealTypeFromMPSNeuronType_(v51, v56, v55, v57);
  v58 = v325;
  v62 = objc_msgSend_outputGateActivation(v325, v59, v60, v61);
  v318[10] = objc_msgSend_montrealTypeFromMPSNeuronType_(v58, v63, v62, v64);
  v65 = v325;
  v69 = objc_msgSend_cellToOutputActivation(v325, v66, v67, v68);
  v318[11] = objc_msgSend_montrealTypeFromMPSNeuronType_(v65, v70, v69, v71);
  v319 = objc_msgSend_inputSize(v325, v72, v73, v74);
  v280 = a5;
  v320 = objc_msgSend_outputSize(v325, v75, v76, v77);
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v78, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v317[0] = &v325;
  v317[1] = &v324;
  v313 = 0u;
  v314 = 0u;
  v315 = 0u;
  v316 = 0u;
  v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3D2E868, v82, (uint64_t)&v313, (uint64_t)v337, 16);
  if (v86)
  {
    v87 = *(_QWORD *)v314;
    do
    {
      for (i = 0; i != v86; ++i)
      {
        if (*(_QWORD *)v314 != v87)
          objc_enumerationMutation(&unk_1E3D2E868);
        v89 = *(void **)(*((_QWORD *)&v313 + 1) + 8 * i);
        objc_msgSend_network(v325, v83, v84, v85);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_deviceHandler(v90, v91, v92, v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = objc_msgSend_outputSize(v325, v95, v96, v97);
        v102 = objc_msgSend_inputSize(v325, v99, v100, v101);
        objc_msgSend_weightMatrixFixedRowBytesWithRows_columns_(v94, v103, v98, v102);
        v104 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_setObject_forKeyedSubscript_(v81, v105, (uint64_t)v104, (uint64_t)v89);
        sub_19C24119C((uint64_t)v317, v89, v104);

      }
      v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3D2E868, v83, (uint64_t)&v313, (uint64_t)v337, 16);
    }
    while (v86);
  }
  v311 = 0u;
  v312 = 0u;
  v309 = 0u;
  v310 = 0u;
  v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3D2E880, v83, (uint64_t)&v309, (uint64_t)v336, 16);
  if (v109)
  {
    v110 = *(_QWORD *)v310;
    do
    {
      for (j = 0; j != v109; ++j)
      {
        if (*(_QWORD *)v310 != v110)
          objc_enumerationMutation(&unk_1E3D2E880);
        v112 = *(void **)(*((_QWORD *)&v309 + 1) + 8 * j);
        objc_msgSend_network(v325, v106, v107, v108);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_deviceHandler(v113, v114, v115, v116);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = objc_msgSend_outputSize(v325, v118, v119, v120);
        v125 = objc_msgSend_outputSize(v325, v122, v123, v124);
        objc_msgSend_weightMatrixFixedRowBytesWithRows_columns_(v117, v126, v121, v125);
        v127 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_setObject_forKeyedSubscript_(v81, v128, (uint64_t)v127, (uint64_t)v112);
        sub_19C24119C((uint64_t)v317, v112, v127);

      }
      v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3D2E880, v106, (uint64_t)&v309, (uint64_t)v336, 16);
    }
    while (v109);
  }
  v307 = 0u;
  v308 = 0u;
  v305 = 0u;
  v306 = 0u;
  v132 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3D2E898, v106, (uint64_t)&v305, (uint64_t)v335, 16);
  if (v132)
  {
    v133 = *(_QWORD *)v306;
    do
    {
      for (k = 0; k != v132; ++k)
      {
        if (*(_QWORD *)v306 != v133)
          objc_enumerationMutation(&unk_1E3D2E898);
        v135 = *(void **)(*((_QWORD *)&v305 + 1) + 8 * k);
        objc_msgSend_network(v325, v129, v130, v131);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_deviceHandler(v136, v137, v138, v139);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        v144 = objc_msgSend_outputSize(v325, v141, v142, v143);
        objc_msgSend_weightMatrixFixedRowBytesWithRows_columns_(v140, v145, 1, v144);
        v146 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_setObject_forKeyedSubscript_(v81, v147, (uint64_t)v146, (uint64_t)v135);
        sub_19C24119C((uint64_t)v317, v135, v146);

      }
      v132 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3D2E898, v129, (uint64_t)&v305, (uint64_t)v335, 16);
    }
    while (v132);
  }
  objc_msgSend_commit(v324, v129, v130, v131);
  objc_msgSend_waitUntilCompleted(v324, v148, v149, v150);
  if ((objc_msgSend_weightAttributes(v325, v151, v152, v153) & 0x20) != 0)
  {
    v202 = objc_msgSend_outputSize(v325, v154, v155, v156);
    v206 = objc_msgSend_inputSize(v325, v203, v204, v205);
    v210 = objc_msgSend_outputSize(v325, v207, v208, v209);
    sub_19C239334(4 * v202 * (v210 + v206));
    v212 = v211;
    v321 = v211;
    v301 = 0u;
    v302 = 0u;
    v303 = 0u;
    v304 = 0u;
    v216 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3D2E868, v213, (uint64_t)&v301, (uint64_t)v334, 16);
    if (v216)
    {
      v217 = *(_QWORD *)v302;
      do
      {
        for (m = 0; m != v216; ++m)
        {
          if (*(_QWORD *)v302 != v217)
            objc_enumerationMutation(&unk_1E3D2E868);
          v219 = *(void **)(*((_QWORD *)&v301 + 1) + 8 * m);
          v220 = v325;
          objc_msgSend_objectForKeyedSubscript_(v81, v214, (uint64_t)v219, v215);
          v221 = (void *)objc_claimAutoreleasedReturnValue();
          v225 = objc_msgSend_unsignedIntegerValue(v219, v222, v223, v224);
          objc_msgSend_exportWeightsWithWeightMatrix_weightID_destination_recurrent_(v220, v226, (uint64_t)v221, v225, v212, 0);

        }
        v216 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3D2E868, v214, (uint64_t)&v301, (uint64_t)v334, 16);
      }
      while (v216);
    }
    v299 = 0u;
    v300 = 0u;
    v297 = 0u;
    v298 = 0u;
    v227 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3D2E880, v214, (uint64_t)&v297, (uint64_t)v333, 16);
    if (v227)
    {
      v228 = *(_QWORD *)v298;
      do
      {
        for (n = 0; n != v227; ++n)
        {
          if (*(_QWORD *)v298 != v228)
            objc_enumerationMutation(&unk_1E3D2E880);
          v230 = *(void **)(*((_QWORD *)&v297 + 1) + 8 * n);
          v231 = v325;
          objc_msgSend_objectForKeyedSubscript_(v81, v188, (uint64_t)v230, v190);
          v232 = (void *)objc_claimAutoreleasedReturnValue();
          v236 = objc_msgSend_unsignedIntegerValue(v230, v233, v234, v235);
          objc_msgSend_exportWeightsWithWeightMatrix_weightID_destination_recurrent_(v231, v237, (uint64_t)v232, v236, v212, 1);

        }
        v227 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3D2E880, v188, (uint64_t)&v297, (uint64_t)v333, 16);
      }
      while (v227);
    }
  }
  else
  {
    v157 = objc_msgSend_outputSize(v325, v154, v155, v156);
    v161 = objc_msgSend_inputSize(v325, v158, v159, v160);
    sub_19C239334(4 * v157 * v161);
    v163 = v162;
    v167 = objc_msgSend_outputSize(v325, v164, v165, v166);
    v171 = objc_msgSend_outputSize(v325, v168, v169, v170);
    sub_19C239334(4 * v167 * v171);
    v173 = v172;
    v321 = v163;
    v322 = v172;
    v293 = 0u;
    v294 = 0u;
    v295 = 0u;
    v296 = 0u;
    v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3D2E868, v174, (uint64_t)&v293, (uint64_t)v332, 16);
    if (v177)
    {
      v178 = *(_QWORD *)v294;
      do
      {
        for (ii = 0; ii != v177; ++ii)
        {
          if (*(_QWORD *)v294 != v178)
            objc_enumerationMutation(&unk_1E3D2E868);
          v180 = *(void **)(*((_QWORD *)&v293 + 1) + 8 * ii);
          v181 = v325;
          objc_msgSend_objectForKeyedSubscript_(v81, v175, (uint64_t)v180, v176);
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          v186 = objc_msgSend_unsignedIntegerValue(v180, v183, v184, v185);
          objc_msgSend_exportWeightsWithWeightMatrix_weightID_destination_recurrent_(v181, v187, (uint64_t)v182, v186, v163, 0);

        }
        v177 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3D2E868, v175, (uint64_t)&v293, (uint64_t)v332, 16);
      }
      while (v177);
    }
    v291 = 0u;
    v292 = 0u;
    v289 = 0u;
    v290 = 0u;
    v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3D2E880, v175, (uint64_t)&v289, (uint64_t)v331, 16);
    if (v191)
    {
      v192 = *(_QWORD *)v290;
      do
      {
        for (jj = 0; jj != v191; ++jj)
        {
          if (*(_QWORD *)v290 != v192)
            objc_enumerationMutation(&unk_1E3D2E880);
          v194 = *(void **)(*((_QWORD *)&v289 + 1) + 8 * jj);
          v195 = v325;
          objc_msgSend_objectForKeyedSubscript_(v81, v188, (uint64_t)v194, v190);
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          v200 = objc_msgSend_unsignedIntegerValue(v194, v197, v198, v199);
          objc_msgSend_exportWeightsWithWeightMatrix_weightID_destination_recurrent_(v195, v201, (uint64_t)v196, v200, v173, 1);

        }
        v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3D2E880, v188, (uint64_t)&v289, (uint64_t)v331, 16);
      }
      while (v191);
    }
  }
  v238 = objc_msgSend_outputSize(v325, v188, v189, v190);
  if ((v238 & 0x3000000000000000) != 0)
    v239 = -1;
  else
    v239 = 16 * v238;
  v240 = (void *)operator new[]();
  bzero(v240, v239);
  v323 = v240;
  v285 = 0u;
  v286 = 0u;
  v287 = 0u;
  v288 = 0u;
  v245 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3D2E898, v241, (uint64_t)&v285, (uint64_t)v330, 16);
  if (v245)
  {
    v246 = *(_QWORD *)v286;
    do
    {
      for (kk = 0; kk != v245; ++kk)
      {
        if (*(_QWORD *)v286 != v246)
          objc_enumerationMutation(&unk_1E3D2E898);
        v248 = *(void **)(*((_QWORD *)&v285 + 1) + 8 * kk);
        objc_msgSend_objectForKeyedSubscript_(v81, v242, (uint64_t)v248, v244);
        v249 = (void *)objc_claimAutoreleasedReturnValue();
        v250 = v325;
        v254 = objc_msgSend_unsignedIntegerValue(v248, v251, v252, v253);
        objc_msgSend_exportWeightsWithWeightMatrix_weightID_destination_recurrent_(v250, v255, (uint64_t)v249, v254, v240, 0);

      }
      v245 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E3D2E898, v242, (uint64_t)&v285, (uint64_t)v330, 16);
    }
    while (v245);
  }
  v328[0] = &unk_1E3D2E750;
  v328[1] = &unk_1E3D2E750;
  v256 = (void *)MEMORY[0x1E0CB37E8];
  v257 = objc_msgSend_inputSize(v325, v242, v243, v244);
  objc_msgSend_numberWithUnsignedInteger_(v256, v258, v257, v259);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  v328[2] = v260;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v261, (uint64_t)v328, 3);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v329 = v262;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v263, (uint64_t)&v329, 1);
  v264 = (void *)objc_claimAutoreleasedReturnValue();

  v326[0] = &unk_1E3D2E750;
  v326[1] = &unk_1E3D2E750;
  v265 = (void *)MEMORY[0x1E0CB37E8];
  v269 = objc_msgSend_outputSize(v325, v266, v267, v268);
  objc_msgSend_numberWithUnsignedInteger_(v265, v270, v269, v271);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  v326[2] = v272;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v273, (uint64_t)v326, 3);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  v327 = v274;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v275, (uint64_t)&v327, 1);
  v276 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_generateNode_model_weightIter_params_inputChunks_outputChunks_(v325, v277, (uint64_t)v283, (uint64_t)v284, v280, v318, v264, v276);
  v278 = (void *)objc_claimAutoreleasedReturnValue();

  return v278;
}

- (void)exportWeightsWithWeightMatrix:(id)a3 weightID:(unint64_t)a4 destination:(float *)a5 recurrent:(BOOL)a6
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  float v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  float v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  unint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  unint64_t v173;
  float v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  unint64_t v181;
  float v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  unint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  unint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  unint64_t v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  unint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  unint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  unint64_t v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  unint64_t v287;
  float *v288;
  uint64_t v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  unint64_t v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  const char *v318;
  uint64_t v319;
  uint64_t v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  unint64_t v324;
  float *v325;
  uint64_t v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  unint64_t v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  const char *v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  const char *v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  const char *v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  const char *v355;
  uint64_t v356;
  uint64_t v357;
  const char *v358;
  uint64_t v359;
  uint64_t v360;
  unint64_t v361;
  float *v362;
  uint64_t v363;
  const char *v364;
  uint64_t v365;
  uint64_t v366;
  unint64_t v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  const char *v374;
  uint64_t v375;
  uint64_t v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  const char *v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  const char *v389;
  uint64_t v390;
  uint64_t v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  unint64_t v395;
  float *v396;
  uint64_t v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  unint64_t v401;
  const char *v402;
  uint64_t v403;
  uint64_t v404;
  const char *v405;
  uint64_t v406;
  uint64_t v407;
  const char *v408;
  uint64_t v409;
  uint64_t v410;
  const char *v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  const char *v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  const char *v419;
  uint64_t v420;
  uint64_t v421;
  const char *v422;
  uint64_t v423;
  uint64_t v424;
  unint64_t v425;
  uint64_t v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  unint64_t v430;
  const char *v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  const char *v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  const char *v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  const char *v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  const char *v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  const char *v455;
  uint64_t v456;
  uint64_t v457;
  const char *v458;
  uint64_t v459;
  uint64_t v460;
  unint64_t v461;
  float *v462;
  uint64_t v463;
  const char *v464;
  uint64_t v465;
  uint64_t v466;
  unint64_t v467;
  const char *v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  const char *v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  const char *v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  const char *v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  const char *v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  const char *v488;
  uint64_t v489;
  uint64_t v490;
  const char *v491;
  uint64_t v492;
  uint64_t v493;
  unint64_t v494;
  float *v495;
  uint64_t v496;
  const char *v497;
  uint64_t v498;
  uint64_t v499;
  unint64_t v500;
  const char *v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  const char *v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  const char *v509;
  uint64_t v510;
  uint64_t v511;
  uint64_t v512;
  const char *v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  const char *v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  const char *v521;
  uint64_t v522;
  uint64_t v523;
  const char *v524;
  uint64_t v525;
  uint64_t v526;
  unint64_t v527;
  float *v528;
  uint64_t v529;
  const char *v530;
  uint64_t v531;
  uint64_t v532;
  unint64_t v533;
  const char *v534;
  uint64_t v535;
  uint64_t v536;
  void *v537;
  void *v538;
  const char *v539;
  id v540;
  id v541;

  v541 = a3;
  objc_msgSend_data(v541, v9, v10, v11);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = objc_msgSend_contents(v12, v13, v14, v15);

  v20 = objc_msgSend_weightAttributes(self, v17, v18, v19);
  v27 = objc_msgSend_weightAttributes(self, v21, v22, v23) & 0x10;
  switch(a4)
  {
    case 3uLL:
      if ((v20 & 0x20) != 0)
      {
        objc_msgSend_outputSize(self, v24, v25, v26);
        objc_msgSend_inputSize(self, v405, v406, v407);
        objc_msgSend_outputSize(self, v408, v409, v410);
        v414 = objc_msgSend_inputSize(self, v411, v412, v413);
        v418 = objc_msgSend_outputSize(self, v415, v416, v417);
        if (objc_msgSend_rows(v541, v419, v420, v421))
        {
          v425 = 0;
          v426 = 4 * (v418 + v414);
          do
          {
            if (objc_msgSend_columns(v541, v422, v423, v424))
            {
              v430 = 0;
              do
              {
                a5[v430] = *(float *)(v16 + 4 * (v430 + v425 * objc_msgSend_columns(v541, v427, v428, v429)));
                ++v430;
              }
              while (objc_msgSend_columns(v541, v431, v432, v433) > v430);
            }
            ++v425;
            a5 = (float *)((char *)a5 + v426);
          }
          while (objc_msgSend_rows(v541, v427, v428, v429) > v425);
        }
      }
      else
      {
        objc_msgSend_inputSize(self, v24, v25, v26);
        objc_msgSend_outputSize(self, v28, v29, v30);
        objc_msgSend_outputSize(self, v31, v32, v33);
        objc_msgSend_outputSize(self, v34, v35, v36);
        if (objc_msgSend_rows(v541, v37, v38, v39))
        {
          v43 = 0;
          v44 = 0;
          do
          {
            if (objc_msgSend_columns(v541, v40, v41, v42))
            {
              v48 = 0;
              do
              {
                a5[v44 + v48] = *(float *)(v16 + 4 * (v48 + v43 * objc_msgSend_columns(v541, v45, v46, v47)));
                ++v48;
              }
              while (objc_msgSend_columns(v541, v49, v50, v51) > v48);
              v44 += v48;
            }
            ++v43;
          }
          while (objc_msgSend_rows(v541, v45, v46, v47) > v43);
        }
      }
      break;
    case 4uLL:
      if ((v20 & 0x20) != 0)
      {
        objc_msgSend_outputSize(self, v24, v25, v26);
        objc_msgSend_inputSize(self, v371, v372, v373);
        objc_msgSend_outputSize(self, v374, v375, v376);
        v380 = objc_msgSend_inputSize(self, v377, v378, v379);
        v384 = objc_msgSend_inputSize(self, v381, v382, v383);
        v388 = objc_msgSend_outputSize(self, v385, v386, v387);
        if (objc_msgSend_rows(v541, v389, v390, v391))
        {
          v395 = 0;
          v396 = &a5[v380];
          v397 = 4 * (v388 + v384);
          do
          {
            if (objc_msgSend_columns(v541, v392, v393, v394))
            {
              v401 = 0;
              do
              {
                v396[v401] = *(float *)(v16 + 4 * (v401 + v395 * objc_msgSend_columns(v541, v398, v399, v400)));
                ++v401;
              }
              while (objc_msgSend_columns(v541, v402, v403, v404) > v401);
            }
            ++v395;
            v396 = (float *)((char *)v396 + v397);
          }
          while (objc_msgSend_rows(v541, v398, v399, v400) > v395);
        }
      }
      else
      {
        objc_msgSend_inputSize(self, v24, v25, v26);
        objc_msgSend_outputSize(self, v146, v147, v148);
        objc_msgSend_outputSize(self, v149, v150, v151);
        objc_msgSend_outputSize(self, v152, v153, v154);
        if (objc_msgSend_rows(v541, v155, v156, v157))
        {
          v161 = 0;
          v162 = 0;
          do
          {
            if (objc_msgSend_columns(v541, v158, v159, v160))
            {
              v166 = 0;
              do
              {
                a5[v162 + v166] = *(float *)(v16 + 4 * (v166 + v161 * objc_msgSend_columns(v541, v163, v164, v165)));
                ++v166;
              }
              while (objc_msgSend_columns(v541, v167, v168, v169) > v166);
              v162 += v166;
            }
            ++v161;
          }
          while (objc_msgSend_rows(v541, v163, v164, v165) > v161);
        }
      }
      break;
    case 6uLL:
      if (objc_msgSend_outputSize(self, v24, v25, v26))
      {
        v181 = 0;
        do
        {
          v182 = *(float *)(v16 + 4 * v181);
          objc_msgSend_outputSize(self, v178, v179, v180);
          a5[v181++] = v182;
        }
        while (objc_msgSend_outputSize(self, v183, v184, v185) > v181);
      }
      break;
    case 7uLL:
      if ((v20 & 0x20) != 0)
      {
        v471 = objc_msgSend_outputSize(self, v24, v25, v26);
        v475 = objc_msgSend_inputSize(self, v472, v473, v474);
        v479 = objc_msgSend_outputSize(self, v476, v477, v478);
        v483 = objc_msgSend_inputSize(self, v480, v481, v482);
        v487 = objc_msgSend_outputSize(self, v484, v485, v486);
        if (objc_msgSend_rows(v541, v488, v489, v490))
        {
          v494 = 0;
          v495 = &a5[(v471 << (v27 >> 4)) * (v479 + v475)];
          v496 = 4 * (v487 + v483);
          do
          {
            if (objc_msgSend_columns(v541, v491, v492, v493))
            {
              v500 = 0;
              do
              {
                v495[v500] = *(float *)(v16 + 4 * (v500 + v494 * objc_msgSend_columns(v541, v497, v498, v499)));
                ++v500;
              }
              while (objc_msgSend_columns(v541, v501, v502, v503) > v500);
            }
            ++v494;
            v495 = (float *)((char *)v495 + v496);
          }
          while (objc_msgSend_rows(v541, v497, v498, v499) > v494);
        }
      }
      else
      {
        v212 = objc_msgSend_inputSize(self, v24, v25, v26);
        v216 = objc_msgSend_outputSize(self, v213, v214, v215);
        objc_msgSend_outputSize(self, v217, v218, v219);
        objc_msgSend_outputSize(self, v220, v221, v222);
        if (objc_msgSend_rows(v541, v223, v224, v225))
        {
          v229 = 0;
          v230 = v216 * (v212 << (v27 >> 4));
          do
          {
            if (objc_msgSend_columns(v541, v226, v227, v228))
            {
              v234 = 0;
              do
              {
                a5[v230 + v234] = *(float *)(v16 + 4 * (v234 + v229 * objc_msgSend_columns(v541, v231, v232, v233)));
                ++v234;
              }
              while (objc_msgSend_columns(v541, v235, v236, v237) > v234);
              v230 += v234;
            }
            ++v229;
          }
          while (objc_msgSend_rows(v541, v231, v232, v233) > v229);
        }
      }
      break;
    case 8uLL:
      if ((v20 & 0x20) != 0)
      {
        v334 = objc_msgSend_outputSize(self, v24, v25, v26);
        v338 = objc_msgSend_inputSize(self, v335, v336, v337);
        v342 = objc_msgSend_outputSize(self, v339, v340, v341);
        v346 = objc_msgSend_inputSize(self, v343, v344, v345);
        v350 = objc_msgSend_inputSize(self, v347, v348, v349);
        v354 = objc_msgSend_outputSize(self, v351, v352, v353);
        if (objc_msgSend_rows(v541, v355, v356, v357))
        {
          v361 = 0;
          v362 = &a5[(v334 << (v27 >> 4)) * (v342 + v338) + v346];
          v363 = 4 * (v354 + v350);
          do
          {
            if (objc_msgSend_columns(v541, v358, v359, v360))
            {
              v367 = 0;
              do
              {
                v362[v367] = *(float *)(v16 + 4 * (v367 + v361 * objc_msgSend_columns(v541, v364, v365, v366)));
                ++v367;
              }
              while (objc_msgSend_columns(v541, v368, v369, v370) > v367);
            }
            ++v361;
            v362 = (float *)((char *)v362 + v363);
          }
          while (objc_msgSend_rows(v541, v364, v365, v366) > v361);
        }
      }
      else
      {
        objc_msgSend_inputSize(self, v24, v25, v26);
        objc_msgSend_outputSize(self, v120, v121, v122);
        v126 = objc_msgSend_outputSize(self, v123, v124, v125);
        v130 = objc_msgSend_outputSize(self, v127, v128, v129);
        if (objc_msgSend_rows(v541, v131, v132, v133))
        {
          v137 = 0;
          v138 = v130 * (v126 << (v27 >> 4));
          do
          {
            if (objc_msgSend_columns(v541, v134, v135, v136))
            {
              v142 = 0;
              do
              {
                a5[v138 + v142] = *(float *)(v16 + 4 * (v142 + v137 * objc_msgSend_columns(v541, v139, v140, v141)));
                ++v142;
              }
              while (objc_msgSend_columns(v541, v143, v144, v145) > v142);
              v138 += v142;
            }
            ++v137;
          }
          while (objc_msgSend_rows(v541, v139, v140, v141) > v137);
        }
      }
      break;
    case 0xAuLL:
      if (objc_msgSend_outputSize(self, v24, v25, v26))
      {
        v173 = 0;
        do
        {
          v174 = *(float *)(v16 + 4 * v173);
          a5[v173 + (objc_msgSend_outputSize(self, v170, v171, v172) << (v27 >> 4))] = v174;
          ++v173;
        }
        while (objc_msgSend_outputSize(self, v175, v176, v177) > v173);
      }
      break;
    case 0xBuLL:
      if ((v20 & 0x20) != 0)
      {
        v504 = objc_msgSend_outputSize(self, v24, v25, v26);
        v508 = objc_msgSend_inputSize(self, v505, v506, v507);
        v512 = objc_msgSend_outputSize(self, v509, v510, v511);
        v516 = objc_msgSend_inputSize(self, v513, v514, v515);
        v520 = objc_msgSend_outputSize(self, v517, v518, v519);
        if (objc_msgSend_rows(v541, v521, v522, v523))
        {
          v527 = 0;
          v528 = &a5[(v504 << ((v27 >> 4) ^ 1u)) * (v512 + v508)];
          v529 = 4 * (v520 + v516);
          do
          {
            if (objc_msgSend_columns(v541, v524, v525, v526))
            {
              v533 = 0;
              do
              {
                v528[v533] = *(float *)(v16 + 4 * (v533 + v527 * objc_msgSend_columns(v541, v530, v531, v532)));
                ++v533;
              }
              while (objc_msgSend_columns(v541, v534, v535, v536) > v533);
            }
            ++v527;
            v528 = (float *)((char *)v528 + v529);
          }
          while (objc_msgSend_rows(v541, v530, v531, v532) > v527);
        }
      }
      else
      {
        v238 = objc_msgSend_inputSize(self, v24, v25, v26);
        v242 = objc_msgSend_outputSize(self, v239, v240, v241);
        objc_msgSend_outputSize(self, v243, v244, v245);
        objc_msgSend_outputSize(self, v246, v247, v248);
        if (objc_msgSend_rows(v541, v249, v250, v251))
        {
          v255 = 0;
          v256 = v242 * (v238 << ((v27 >> 4) ^ 1u));
          do
          {
            if (objc_msgSend_columns(v541, v252, v253, v254))
            {
              v260 = 0;
              do
              {
                a5[v256 + v260] = *(float *)(v16 + 4 * (v260 + v255 * objc_msgSend_columns(v541, v257, v258, v259)));
                ++v260;
              }
              while (objc_msgSend_columns(v541, v261, v262, v263) > v260);
              v256 += v260;
            }
            ++v255;
          }
          while (objc_msgSend_rows(v541, v257, v258, v259) > v255);
        }
      }
      break;
    case 0xCuLL:
      if ((v20 & 0x20) != 0)
      {
        v434 = objc_msgSend_outputSize(self, v24, v25, v26);
        v438 = objc_msgSend_inputSize(self, v435, v436, v437);
        v442 = objc_msgSend_outputSize(self, v439, v440, v441);
        v446 = objc_msgSend_inputSize(self, v443, v444, v445);
        v450 = objc_msgSend_inputSize(self, v447, v448, v449);
        v454 = objc_msgSend_outputSize(self, v451, v452, v453);
        if (objc_msgSend_rows(v541, v455, v456, v457))
        {
          v461 = 0;
          v462 = &a5[(v434 << ((v27 >> 4) ^ 1u)) * (v442 + v438) + v446];
          v463 = 4 * (v454 + v450);
          do
          {
            if (objc_msgSend_columns(v541, v458, v459, v460))
            {
              v467 = 0;
              do
              {
                v462[v467] = *(float *)(v16 + 4 * (v467 + v461 * objc_msgSend_columns(v541, v464, v465, v466)));
                ++v467;
              }
              while (objc_msgSend_columns(v541, v468, v469, v470) > v467);
            }
            ++v461;
            v462 = (float *)((char *)v462 + v463);
          }
          while (objc_msgSend_rows(v541, v464, v465, v466) > v461);
        }
      }
      else
      {
        objc_msgSend_inputSize(self, v24, v25, v26);
        objc_msgSend_outputSize(self, v186, v187, v188);
        v192 = objc_msgSend_outputSize(self, v189, v190, v191);
        v196 = objc_msgSend_outputSize(self, v193, v194, v195);
        if (objc_msgSend_rows(v541, v197, v198, v199))
        {
          v203 = 0;
          v204 = v196 * (v192 << ((v27 >> 4) ^ 1u));
          do
          {
            if (objc_msgSend_columns(v541, v200, v201, v202))
            {
              v208 = 0;
              do
              {
                a5[v204 + v208] = *(float *)(v16 + 4 * (v208 + v203 * objc_msgSend_columns(v541, v205, v206, v207)));
                ++v208;
              }
              while (objc_msgSend_columns(v541, v209, v210, v211) > v208);
              v204 += v208;
            }
            ++v203;
          }
          while (objc_msgSend_rows(v541, v205, v206, v207) > v203);
        }
      }
      break;
    case 0xEuLL:
      if (objc_msgSend_outputSize(self, v24, v25, v26))
      {
        v115 = 0;
        do
        {
          v116 = *(float *)(v16 + 4 * v115);
          a5[v115 + (objc_msgSend_outputSize(self, v112, v113, v114) << ((v27 >> 4) ^ 1u))] = v116;
          ++v115;
        }
        while (objc_msgSend_outputSize(self, v117, v118, v119) > v115);
      }
      break;
    case 0xFuLL:
      if ((v20 & 0x20) != 0)
      {
        v264 = objc_msgSend_outputSize(self, v24, v25, v26);
        v268 = objc_msgSend_inputSize(self, v265, v266, v267);
        v272 = objc_msgSend_outputSize(self, v269, v270, v271);
        v276 = objc_msgSend_inputSize(self, v273, v274, v275);
        v280 = objc_msgSend_outputSize(self, v277, v278, v279);
        if (objc_msgSend_rows(v541, v281, v282, v283))
        {
          v287 = 0;
          v288 = &a5[3 * v264 * (v272 + v268)];
          v289 = 4 * (v280 + v276);
          do
          {
            if (objc_msgSend_columns(v541, v284, v285, v286))
            {
              v293 = 0;
              do
              {
                v288[v293] = *(float *)(v16 + 4 * (v293 + v287 * objc_msgSend_columns(v541, v290, v291, v292)));
                ++v293;
              }
              while (objc_msgSend_columns(v541, v294, v295, v296) > v293);
            }
            ++v287;
            v288 = (float *)((char *)v288 + v289);
          }
          while (objc_msgSend_rows(v541, v290, v291, v292) > v287);
        }
      }
      else
      {
        v60 = objc_msgSend_inputSize(self, v24, v25, v26);
        v64 = objc_msgSend_outputSize(self, v61, v62, v63);
        objc_msgSend_outputSize(self, v65, v66, v67);
        objc_msgSend_outputSize(self, v68, v69, v70);
        if (objc_msgSend_rows(v541, v71, v72, v73))
        {
          v77 = 0;
          v78 = 3 * v60 * v64;
          do
          {
            if (objc_msgSend_columns(v541, v74, v75, v76))
            {
              v82 = 0;
              do
              {
                a5[v78 + v82] = *(float *)(v16 + 4 * (v82 + v77 * objc_msgSend_columns(v541, v79, v80, v81)));
                ++v82;
              }
              while (objc_msgSend_columns(v541, v83, v84, v85) > v82);
              v78 += v82;
            }
            ++v77;
          }
          while (objc_msgSend_rows(v541, v79, v80, v81) > v77);
        }
      }
      break;
    case 0x10uLL:
      if ((v20 & 0x20) != 0)
      {
        v297 = objc_msgSend_outputSize(self, v24, v25, v26);
        v301 = objc_msgSend_inputSize(self, v298, v299, v300);
        v305 = objc_msgSend_outputSize(self, v302, v303, v304);
        v309 = objc_msgSend_inputSize(self, v306, v307, v308);
        v313 = objc_msgSend_inputSize(self, v310, v311, v312);
        v317 = objc_msgSend_outputSize(self, v314, v315, v316);
        if (objc_msgSend_rows(v541, v318, v319, v320))
        {
          v324 = 0;
          v325 = &a5[3 * v297 * (v305 + v301) + v309];
          v326 = 4 * (v317 + v313);
          do
          {
            if (objc_msgSend_columns(v541, v321, v322, v323))
            {
              v330 = 0;
              do
              {
                v325[v330] = *(float *)(v16 + 4 * (v330 + v324 * objc_msgSend_columns(v541, v327, v328, v329)));
                ++v330;
              }
              while (objc_msgSend_columns(v541, v331, v332, v333) > v330);
            }
            ++v324;
            v325 = (float *)((char *)v325 + v326);
          }
          while (objc_msgSend_rows(v541, v327, v328, v329) > v324);
        }
      }
      else
      {
        objc_msgSend_inputSize(self, v24, v25, v26);
        objc_msgSend_outputSize(self, v86, v87, v88);
        v92 = objc_msgSend_outputSize(self, v89, v90, v91);
        v96 = objc_msgSend_outputSize(self, v93, v94, v95);
        if (objc_msgSend_rows(v541, v97, v98, v99))
        {
          v103 = 0;
          v104 = 3 * v92 * v96;
          do
          {
            if (objc_msgSend_columns(v541, v100, v101, v102))
            {
              v108 = 0;
              do
              {
                a5[v104 + v108] = *(float *)(v16 + 4 * (v108 + v103 * objc_msgSend_columns(v541, v105, v106, v107)));
                ++v108;
              }
              while (objc_msgSend_columns(v541, v109, v110, v111) > v108);
              v104 += v108;
            }
            ++v103;
          }
          while (objc_msgSend_rows(v541, v105, v106, v107) > v103);
        }
      }
      break;
    case 0x12uLL:
      if (objc_msgSend_outputSize(self, v24, v25, v26))
      {
        v55 = 0;
        do
        {
          v56 = *(float *)(v16 + 4 * v55);
          a5[3 * objc_msgSend_outputSize(self, v52, v53, v54) + v55++] = v56;
        }
        while (objc_msgSend_outputSize(self, v57, v58, v59) > v55);
      }
      break;
    default:
      v537 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v24, (uint64_t)CFSTR("Unknown weight ID %tu"), v26, a4);
      v538 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_exceptionWithName_reason_userInfo_(v537, v539, *MEMORY[0x1E0C99768], (uint64_t)v538, 0);
      v540 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v540);
  }

}

- (id)matrixIDToString:(unint64_t)a3
{
  if (a3 - 3 > 0xF)
    return CFSTR("Unknown Matrix ID");
  else
    return off_1E3D258C8[a3 - 3];
}

- (unint64_t)inputSize
{
  return self->_inputSize;
}

- (void)setInputSize:(unint64_t)a3
{
  self->_inputSize = a3;
}

- (unint64_t)outputSize
{
  return self->_outputSize;
}

- (void)setOutputSize:(unint64_t)a3
{
  self->_outputSize = a3;
}

- (int)inputGateActivation
{
  return self->_inputGateActivation;
}

- (void)setInputGateActivation:(int)a3
{
  self->_inputGateActivation = a3;
}

- (int)forgetGateActivation
{
  return self->_forgetGateActivation;
}

- (void)setForgetGateActivation:(int)a3
{
  self->_forgetGateActivation = a3;
}

- (int)cellGateActivation
{
  return self->_cellGateActivation;
}

- (void)setCellGateActivation:(int)a3
{
  self->_cellGateActivation = a3;
}

- (int)outputGateActivation
{
  return self->_outputGateActivation;
}

- (void)setOutputGateActivation:(int)a3
{
  self->_outputGateActivation = a3;
}

- (int)cellToOutputActivation
{
  return self->_cellToOutputActivation;
}

- (void)setCellToOutputActivation:(int)a3
{
  self->_cellToOutputActivation = a3;
}

- (MPSLSTMDescriptor)lstmDesc
{
  return (MPSLSTMDescriptor *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLstmDesc:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (MPSRNNMatrixTrainingLayer)filter
{
  return (MPSRNNMatrixTrainingLayer *)objc_getProperty(self, a2, 184, 1);
}

- (void)setFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSMutableArray)optimizers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setOptimizers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSMutableArray)weights
{
  return (NSMutableArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setWeights:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSMutableArray)weightGradients
{
  return (NSMutableArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setWeightGradients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSMutableArray)trainingStates
{
  return (NSMutableArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setTrainingStates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (float)initialWeights_0
{
  return self->_initialWeights_0;
}

- (void)setInitialWeights_0:(float *)a3
{
  self->_initialWeights_0 = a3;
}

- (float)initialWeights_1
{
  return self->_initialWeights_1;
}

- (void)setInitialWeights_1:(float *)a3
{
  self->_initialWeights_1 = a3;
}

- (float)initialBias_0
{
  return self->_initialBias_0;
}

- (void)setInitialBias_0:(float *)a3
{
  self->_initialBias_0 = a3;
}

- (float)initialBias_1
{
  return self->_initialBias_1;
}

- (void)setInitialBias_1:(float *)a3
{
  self->_initialBias_1 = a3;
}

- (unint64_t)weightAttributes
{
  return self->_weightAttributes;
}

- (void)setWeightAttributes:(unint64_t)a3
{
  self->_weightAttributes = a3;
}

- (NSArray)srcMatrices
{
  return (NSArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setSrcMatrices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srcMatrices, 0);
  objc_storeStrong((id *)&self->_trainingStates, 0);
  objc_storeStrong((id *)&self->_weightGradients, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_optimizers, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_lstmDesc, 0);
}

@end
