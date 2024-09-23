@implementation MLPNetwork

+ (MLPNetwork)networkWithLayers:(id)a3 inputLength:(unint64_t)a4 inputHeight:(unint64_t)a5 inputChannels:(unint64_t)a6 batchSize:(unint64_t)a7 lossBatchSize:(unint64_t)a8 options:(id)a9 deviceHandler:(id)a10 optimizerParams:(id)a11
{
  id v16;
  id v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  MLPSeqNetwork *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  MLPCNNNetwork *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  id v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t i;
  const char *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  id v197;
  id v198;
  id v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  _BYTE v204[128];
  uint64_t v205;

  v205 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v198 = a9;
  v199 = a10;
  v197 = a11;
  v200 = 0u;
  v201 = 0u;
  v202 = 0u;
  v203 = 0u;
  v17 = v16;
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v200, (uint64_t)v204, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v201;
LABEL_3:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v201 != v23)
        objc_enumerationMutation(v17);
      if (objc_msgSend_layerType(*(void **)(*((_QWORD *)&v200 + 1) + 8 * v24), v19, v20, v21) == 8)
        break;
      if (v22 == ++v24)
      {
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v200, (uint64_t)v204, 16);
        if (v22)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v25 = [MLPSeqNetwork alloc];
    v28 = (void *)objc_msgSend_initWithLayers_(v25, v26, (uint64_t)v17, v27);

    if (v28)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  v31 = [MLPCNNNetwork alloc];
  v28 = (void *)objc_msgSend_initWithLayers_(v31, v32, (uint64_t)v17, v33);
LABEL_12:
  objc_msgSend_setOptions_(v28, v29, (uint64_t)v198, v30);
  v36 = objc_msgSend_exMRL_BOOLForKey_(v198, v34, (uint64_t)MLPModelTrainerComputeLossOnEvaluationKey[0], v35);
  objc_msgSend_setComputeLossOnInference_(v28, v37, v36, v38);
  objc_msgSend_setDeviceHandler_(v28, v39, (uint64_t)v199, v40);
  v41 = objc_alloc(MEMORY[0x1E0CC6E30]);
  objc_msgSend_device(v199, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend_dataLayout(v199, v46, v47, v48);
  v51 = (void *)objc_msgSend_initWithDevice_dataLayout_(v41, v50, (uint64_t)v45, v49);
  objc_msgSend_setI2mKernel_(v28, v52, (uint64_t)v51, v53);

  v54 = objc_alloc(MEMORY[0x1E0CC6EF0]);
  objc_msgSend_device(v199, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend_dataLayout(v199, v59, v60, v61);
  v64 = (void *)objc_msgSend_initWithDevice_dataLayout_(v54, v63, (uint64_t)v58, v62);
  objc_msgSend_setM2iKernel_(v28, v65, (uint64_t)v64, v66);

  objc_msgSend_setOptimizerParams_(v28, v67, (uint64_t)v197, v68);
  objc_msgSend_setInputLength_(v28, v69, a4, v70);
  objc_msgSend_setInputHeight_(v28, v71, a5, v72);
  objc_msgSend_setInputChannels_(v28, v73, a6, v74);
  objc_msgSend_setBatchSize_(v28, v75, a7, v76);
  objc_msgSend_setLossBatchSize_(v28, v77, a8, v78);
  if (objc_msgSend_count(v17, v79, v80, v81))
  {
    if (objc_msgSend_count(v17, v82, v83, v84) == 1)
    {
      v87 = 0;
    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(v17, v85, 1, v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_objectAtIndexedSubscript_(v17, v85, 0, v86);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_updatePreviousLayer_nextLayer_network_(v88, v89, 0, (uint64_t)v87, v28);
    if (!objc_msgSend_inputLength(v88, v90, v91, v92))
    {
      objc_msgSend_name(v88, v93, v94, v95);
      v96 = objc_claimAutoreleasedReturnValue();
      sub_19C09C77C(CFSTR("Input length for layer %@ is 0"), v97, v98, v99, v100, v101, v102, v103, v96);
    }
    if (!objc_msgSend_inputChannels(v88, v93, v94, v95))
    {
      objc_msgSend_name(v88, v104, v105, v106);
      v107 = objc_claimAutoreleasedReturnValue();
      sub_19C09C77C(CFSTR("Input channels for layer %@ is 0"), v108, v109, v110, v111, v112, v113, v114, v107);
    }
    if (!objc_msgSend_outputLength(v88, v104, v105, v106))
    {
      objc_msgSend_name(v88, v115, v116, v117);
      v118 = objc_claimAutoreleasedReturnValue();
      sub_19C09C77C(CFSTR("Output length for layer %@ is 0"), v119, v120, v121, v122, v123, v124, v125, v118);
    }
    if (!objc_msgSend_outputChannels(v88, v115, v116, v117))
    {
      objc_msgSend_name(v88, v126, v127, v128);
      v129 = objc_claimAutoreleasedReturnValue();
      sub_19C09C77C(CFSTR("Output channels for layer %@ is 0"), v130, v131, v132, v133, v134, v135, v136, v129);
    }

    for (i = 2; i - 1 < (unint64_t)objc_msgSend_count(v17, v137, v138, v139); ++i)
    {
      if (i - 1 >= (unint64_t)(objc_msgSend_count(v17, v82, v83, v84) - 1))
      {
        v143 = 0;
      }
      else
      {
        objc_msgSend_objectAtIndexedSubscript_(v17, v141, i, v142);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend_objectAtIndexedSubscript_(v17, v141, i - 2, v142);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v17, v145, i - 1, v146);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updatePreviousLayer_nextLayer_network_(v147, v148, (uint64_t)v144, (uint64_t)v143, v28);
      if (!objc_msgSend_inputLength(v147, v149, v150, v151))
      {
        objc_msgSend_name(v147, v152, v153, v154);
        v155 = objc_claimAutoreleasedReturnValue();
        sub_19C09C77C(CFSTR("Input length for layer %@ is 0"), v156, v157, v158, v159, v160, v161, v162, v155);
      }
      if (!objc_msgSend_inputChannels(v147, v152, v153, v154))
      {
        objc_msgSend_name(v147, v163, v164, v165);
        v166 = objc_claimAutoreleasedReturnValue();
        sub_19C09C77C(CFSTR("Input channels for layer %@ is 0"), v167, v168, v169, v170, v171, v172, v173, v166);
      }
      if (!objc_msgSend_outputLength(v147, v163, v164, v165))
      {
        objc_msgSend_name(v147, v174, v175, v176);
        v177 = objc_claimAutoreleasedReturnValue();
        sub_19C09C77C(CFSTR("Output length for layer %@ is 0"), v178, v179, v180, v181, v182, v183, v184, v177);
      }
      if (!objc_msgSend_outputChannels(v147, v174, v175, v176))
      {
        objc_msgSend_name(v147, v185, v186, v187);
        v188 = objc_claimAutoreleasedReturnValue();
        sub_19C09C77C(CFSTR("Output channels for layer %@ is 0"), v189, v190, v191, v192, v193, v194, v195, v188);
      }

    }
  }
  objc_msgSend_createLayerKernels(v28, v82, v83, v84);

  return (MLPNetwork *)v28;
}

- (MLPNetwork)initWithLayers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v8, (uint64_t)CFSTR("%@ not implemented in a subclass"), v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v5, v11, *MEMORY[0x1E0C99768], (uint64_t)v10, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v12);
}

- (MLPNetwork)initWithNetworkType:(unint64_t)a3 layers:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  MLPNetwork *v10;
  uint64_t v11;
  NSArray *layers;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MLPNetwork;
  v10 = -[MLPNetwork init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v6, v7, v8, v9);
    layers = v10->_layers;
    v10->_layers = (NSArray *)v11;

    v10->_networkType = a3;
  }

  return v10;
}

- (void)generateModelContainer
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  MontrealNNGenerateModel *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
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
  void *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  id v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *ModelContainer;
  void *v82;
  id obj;
  unsigned int isEqualToString;
  _BYTE v85[448];
  _BYTE v86[128];
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  objc_msgSend_options(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)MLPModelGenerateFormatKey[0], v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = v8;
  isEqualToString = objc_msgSend_isEqualToString_(v8, v9, (uint64_t)MLPModelGenerateFormatJSON[0], v10);
  v11 = [MontrealNNGenerateModel alloc];
  v14 = (void *)objc_msgSend_initWithWeightFormat_(v11, v12, isEqualToString, v13);
  v92 = 1;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  objc_msgSend_layers(self, v15, v16, v17);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v88, (uint64_t)v93, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v89;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v89 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
        v24 = (void *)MEMORY[0x1A1AD2100]();
        objc_msgSend_name(v23, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_generateNode_model_weightIter_(v23, v29, (uint64_t)v28, (uint64_t)v14, &v92);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (isEqualToString)
        {
          if (v30)
          {
            objc_msgSend_parameters(v30, v31, v32, v33);
            sub_19C08F51C((uint64_t)v86);
            objc_msgSend_parameters(v30, v34, v35, v36);
          }
          else
          {
            bzero(v85, 0x2C0uLL);
            sub_19C08F51C((uint64_t)v86);
            bzero(v85, 0x2C0uLL);
          }
          sub_19C08F51C((uint64_t)&v87);
        }
        if (v30)
        {
          objc_msgSend_merge_(v14, v31, (uint64_t)v30, v33);
          if (v19)
          {
            objc_msgSend_node(v30, v37, v38, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_inputs(v40, v41, v42, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndex_(v44, v45, 0, v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removeInput_(v14, v48, (uint64_t)v47, v49);

            objc_msgSend_node(v19, v50, v51, v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_outputs(v53, v54, v55, v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndex_(v57, v58, 0, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_removeOutput_(v14, v61, (uint64_t)v60, v62);

            objc_msgSend_node(v19, v63, v64, v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_outputs(v66, v67, v68, v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndex_(v70, v71, 0, v72);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setInput_inputIndex_(v30, v74, (uint64_t)v73, 0);

          }
          v75 = v30;

          v19 = v75;
        }

        objc_autoreleasePoolPop(v24);
        if (!v30)
        {

          ModelContainer = 0;
          goto LABEL_20;
        }
      }
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v76, (uint64_t)&v88, (uint64_t)v93, 16);
      if (v20)
        continue;
      break;
    }
  }

  ModelContainer = (void *)objc_msgSend_generateModelContainer(v14, v77, v78, v79);
LABEL_20:

  return ModelContainer;
}

- (void)runTraining:(id)a3 databatch:(id)a4 iteration:(unint64_t)a5 lossCallback:(id)a6 semaphore:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = (void *)MEMORY[0x1E0C99DA0];
  v16 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v16, v18, (uint64_t)CFSTR("%@ not implemented in a subclass"), v19, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v15, v21, *MEMORY[0x1E0C99768], (uint64_t)v20, 0);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v22);
}

- (unint64_t)runInference:(id)a3 databatch:(id)a4 inferredResult:(id)a5 semaphore:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1E0C99DA0];
  v15 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v15, v17, (uint64_t)CFSTR("%@ not implemented in a subclass"), v18, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v14, v20, *MEMORY[0x1E0C99768], (uint64_t)v19, 0);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v21);
}

- (id)computeInference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v8, (uint64_t)CFSTR("%@ not implemented in a subclass"), v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v5, v11, *MEMORY[0x1E0C99768], (uint64_t)v10, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v12);
}

- (void)createLayerKernels
{
  void *v2;
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("%@ not implemented in a subclass"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v2, v8, *MEMORY[0x1E0C99768], (uint64_t)v7, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v9);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)layers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLayers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)networkType
{
  return self->_networkType;
}

- (void)setNetworkType:(unint64_t)a3
{
  self->_networkType = a3;
}

- (MLPDeviceHandler)deviceHandler
{
  return (MLPDeviceHandler *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (MPSImageCopyToMatrix)i2mKernel
{
  return (MPSImageCopyToMatrix *)objc_getProperty(self, a2, 48, 1);
}

- (void)setI2mKernel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (MPSMatrixCopyToImage)m2iKernel
{
  return (MPSMatrixCopyToImage *)objc_getProperty(self, a2, 56, 1);
}

- (void)setM2iKernel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (MontrealNNModelOptimizerParam)optimizerParams
{
  return (MontrealNNModelOptimizerParam *)objc_getProperty(self, a2, 64, 1);
}

- (void)setOptimizerParams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (unint64_t)inputLength
{
  return self->_inputLength;
}

- (void)setInputLength:(unint64_t)a3
{
  self->_inputLength = a3;
}

- (unint64_t)inputHeight
{
  return self->_inputHeight;
}

- (void)setInputHeight:(unint64_t)a3
{
  self->_inputHeight = a3;
}

- (unint64_t)inputChannels
{
  return self->_inputChannels;
}

- (void)setInputChannels:(unint64_t)a3
{
  self->_inputChannels = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unint64_t)lossBatchSize
{
  return self->_lossBatchSize;
}

- (void)setLossBatchSize:(unint64_t)a3
{
  self->_lossBatchSize = a3;
}

- (BOOL)computeLossOnInference
{
  return self->_computeLossOnInference;
}

- (void)setComputeLossOnInference:(BOOL)a3
{
  self->_computeLossOnInference = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optimizerParams, 0);
  objc_storeStrong((id *)&self->_m2iKernel, 0);
  objc_storeStrong((id *)&self->_i2mKernel, 0);
  objc_storeStrong((id *)&self->_deviceHandler, 0);
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
