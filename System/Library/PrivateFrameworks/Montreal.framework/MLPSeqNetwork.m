@implementation MLPSeqNetwork

- (MLPSeqNetwork)initWithLayers:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MLPSeqNetwork;
  return -[MLPNetwork initWithNetworkType:layers:](&v4, sel_initWithNetworkType_layers_, 2, a3);
}

- (void)setOptimizerParams:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  MontrealNNModelOptimizerParam *v51;
  double v52;
  double v53;
  const char *v54;
  objc_super v55;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend_options(self, v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exMRL_stringForKey_(v8, v9, (uint64_t)MLPModelTrainerOptimizerAlgorithmKey[0], v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (objc_msgSend_isEqualToString_(v11, v12, (uint64_t)MLPModelTrainerOptimizerAdam[0], v14))
        v15 = 1;
      else
        v15 = 2;
    }
    else
    {
      v15 = 2;
    }
    objc_msgSend_options(self, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exMRL_numberForKey_(v16, v17, (uint64_t)MLPModelTrainerLearningRateKey[0], v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v19, v20, v21, v22);
    v24 = v23;

    objc_msgSend_options(self, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exMRL_numberForKey_(v28, v29, (uint64_t)MLPModelTrainerOptimizerMomentumKey[0], v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v31, v32, v33, v34);
    v36 = v35;

    objc_msgSend_options(self, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exMRL_numberForKey_(v40, v41, (uint64_t)MLPModelTrainerGradientClipMinimum[0], v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_options(self, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exMRL_numberForKey_(v47, v48, (uint64_t)MLPModelTrainerGradientClipMaximum[0], v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = [MontrealNNModelOptimizerParam alloc];
    LODWORD(v52) = v24;
    LODWORD(v53) = v36;
    v7 = (id)objc_msgSend_initWithOptimizerType_learningRate_momentum_gradientClipMin_gradientClipMax_(v51, v54, v15, (uint64_t)v43, v50, v52, v53);

  }
  v55.receiver = self;
  v55.super_class = (Class)MLPSeqNetwork;
  -[MLPNetwork setOptimizerParams:](&v55, sel_setOptimizerParams_, v7);

}

- (void)createLayerKernels
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  MLPLearningRateDecayHandler *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  objc_msgSend_layers(self, a2, v2, v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v76, (uint64_t)v80, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v77 != v11)
          objc_enumerationMutation(v5);
        objc_msgSend_createKernel(*(void **)(*((_QWORD *)&v76 + 1) + 8 * i), v7, v8, v9);
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v76, (uint64_t)v80, 16);
    }
    while (v10);
  }

  objc_msgSend_optimizerParams(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_optimizerType(v16, v17, v18, v19) == 2;

  if (v20)
  {
    objc_msgSend_options(self, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exMRL_numberForKey_(v24, v25, (uint64_t)MLPModelTrainerLearningRateDecayRateKey[0], v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_floatValue(v27, v28, v29, v30);
    if (v34 < 0.0)
    {
LABEL_18:

      return;
    }
    objc_msgSend_options(self, v31, v32, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exMRL_numberForKey_(v35, v36, (uint64_t)MLPModelTrainerLearningRateDecayStepsKey[0], v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_options(self, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exMRL_numberForKey_(v42, v43, (uint64_t)MLPModelTrainerLearningRateDecayRateKey[0], v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_options(self, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exMRL_numberForKey_(v49, v50, (uint64_t)MLPModelTrainerLearningRateDecayStairCaseKey[0], v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v56 = objc_msgSend_unsignedIntegerValue(v38, v53, v54, v55);
      if (v45)
        goto LABEL_12;
    }
    else
    {
      v56 = 1000;
      if (v45)
      {
LABEL_12:
        objc_msgSend_floatValue(v45, v53, v54, v55);
        if (v52)
        {
LABEL_13:
          v57 = objc_msgSend_BOOLValue(v52, v53, v54, v55);
LABEL_17:
          v58 = [MLPLearningRateDecayHandler alloc];
          objc_msgSend_optimizerParams(self, v59, v60, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_learningRate(v62, v63, v64, v65);
          v67 = (void *)objc_msgSend_initWithLearningRate_decaySteps_decayRate_stairCase_(v58, v66, v56, v57);
          objc_msgSend_setSeqLearningRateDecayHandler_(self, v68, (uint64_t)v67, v69);

          objc_msgSend_seqLearningRateDecayHandler(self, v70, v71, v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setDelegate_(v73, v74, (uint64_t)self, v75);

          goto LABEL_18;
        }
LABEL_16:
        v57 = 1;
        goto LABEL_17;
      }
    }
    if (v52)
      goto LABEL_13;
    goto LABEL_16;
  }
}

- (void)runTraining:(id)a3 databatch:(id)a4 iteration:(unint64_t)a5 lossCallback:(id)a6 semaphore:(id)a7
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
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
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t j;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  BOOL v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  id v88;
  id v89;
  id v90;
  id v91;
  const char *v92;
  uint64_t v93;
  id v95;
  id v96;
  void *v97;
  _QWORD v98[4];
  id v99;
  id v100;
  id v101;
  id v102;
  id v103[2];
  id location;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v95 = a6;
  v96 = a7;
  v13 = v12;
  objc_msgSend_matrix(v13, v14, v15, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend_layers(self, v17, v18, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (i >= v26)
      break;
    v30 = (void *)MEMORY[0x1A1AD2100]();
    objc_msgSend_layers(self, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v34, v35, i, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_seqForward_input_dataBatch_runInference_(v37, v38, (uint64_t)v11, (uint64_t)v20, v13, 0);
    v39 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v30);
    v20 = (void *)v39;
  }
  objc_msgSend_combinedLossLabels(v13, v27, v28, v29);
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_largeReductionSumResult(v97, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v109, (uint64_t)v114, 16);
  if (v47)
  {
    v48 = *(_QWORD *)v110;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v110 != v48)
          objc_enumerationMutation(v43);
        objc_msgSend_synchronizeOnCommandBuffer_(*(void **)(*((_QWORD *)&v109 + 1) + 8 * v49++), v45, (uint64_t)v11, v46);
      }
      while (v47 != v49);
      v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v45, (uint64_t)&v109, (uint64_t)v114, 16);
    }
    while (v47);
  }

  v108 = 0u;
  v106 = 0u;
  v107 = 0u;
  v105 = 0u;
  objc_msgSend_smallReductionSumResult(v97, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v105, (uint64_t)v113, 16);
  if (v57)
  {
    v58 = *(_QWORD *)v106;
    do
    {
      v59 = 0;
      do
      {
        if (*(_QWORD *)v106 != v58)
          objc_enumerationMutation(v53);
        objc_msgSend_synchronizeOnCommandBuffer_(*(void **)(*((_QWORD *)&v105 + 1) + 8 * v59++), v55, (uint64_t)v11, v56);
      }
      while (v57 != v59);
      v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v55, (uint64_t)&v105, (uint64_t)v113, 16);
    }
    while (v57);
  }

  v63 = 0;
  for (j = -1; ; --j)
  {
    objc_msgSend_layers(self, v60, v61, v62);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v63 < objc_msgSend_count(v65, v66, v67, v68);

    if (!v69)
      break;
    v70 = (void *)MEMORY[0x1A1AD2100]();
    objc_msgSend_layers(self, v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend_count(v74, v75, v76, v77);

    objc_msgSend_layers(self, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v82, v83, j + v78, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_seqBackward_dataBatch_inputGradient_(v85, v86, (uint64_t)v11, (uint64_t)v13, v20);
    v87 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v70);
    ++v63;
    v20 = (void *)v87;
  }
  objc_initWeak(&location, self);
  v98[0] = MEMORY[0x1E0C809B0];
  v98[1] = 3221225472;
  v98[2] = sub_19C1930FC;
  v98[3] = &unk_1E3D25590;
  objc_copyWeak(v103, &location);
  v88 = v97;
  v99 = v88;
  v89 = v13;
  v100 = v89;
  v90 = v95;
  v102 = v90;
  v103[1] = (id)a5;
  v91 = v96;
  v101 = v91;
  objc_msgSend_addCompletedHandler_(v11, v92, (uint64_t)v98, v93);

  objc_destroyWeak(v103);
  objc_destroyWeak(&location);

}

- (float)computeLoss:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  float v13;
  float *v15;
  float v16;

  v16 = 0.0;
  objc_msgSend_combinedLossLabels(a3, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_largeReductionSumResult(v4, v5, v6, v7, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C1932B8(&v15, v8, 0x20uLL);

  objc_msgSend_smallReductionSumResult(v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C1932B8(&v15, v12, 1uLL);

  v13 = v16;
  return v13;
}

- (unint64_t)runInference:(id)a3 databatch:(id)a4 inferredResult:(id)a5 semaphore:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t i;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  id v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  id v96;
  id v97;
  void *v98;
  _QWORD v99[4];
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id location;
  __int128 v107;
  __int128 v108;
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
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v96 = a5;
  v97 = a6;
  v12 = v11;
  objc_msgSend_matrix(v12, v13, v14, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend_layers(self, v16, v17, v18, v96);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_count(v21, v22, v23, v24);

    if (i >= v25)
      break;
    v26 = (void *)MEMORY[0x1A1AD2100]();
    objc_msgSend_layers(self, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v30, v31, i, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_seqForward_input_dataBatch_runInference_(v33, v34, (uint64_t)v10, (uint64_t)v19, v12, 1);
    v35 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v26);
    v19 = (void *)v35;
  }
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v36 = v19;
  v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v115, (uint64_t)v121, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v116;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v116 != v39)
          objc_enumerationMutation(v36);
        v41 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v40);
        v42 = (void *)MEMORY[0x1A1AD2100]();
        objc_msgSend_deviceHandler(self, v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_data(v41, v47, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_importDataFromGPU_cmdBuf_(v46, v51, (uint64_t)v50, (uint64_t)v10);

        objc_autoreleasePoolPop(v42);
        ++v40;
      }
      while (v38 != v40);
      v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v52, (uint64_t)&v115, (uint64_t)v121, 16);
    }
    while (v38);
  }

  objc_msgSend_combinedLossLabels(v12, v53, v54, v55);
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_largeReductionSumResult(v98, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v111, (uint64_t)v120, 16);
  if (v63)
  {
    v64 = *(_QWORD *)v112;
    do
    {
      v65 = 0;
      do
      {
        if (*(_QWORD *)v112 != v64)
          objc_enumerationMutation(v59);
        objc_msgSend_synchronizeOnCommandBuffer_(*(void **)(*((_QWORD *)&v111 + 1) + 8 * v65++), v61, (uint64_t)v10, v62);
      }
      while (v63 != v65);
      v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v61, (uint64_t)&v111, (uint64_t)v120, 16);
    }
    while (v63);
  }

  v110 = 0u;
  v108 = 0u;
  v109 = 0u;
  v107 = 0u;
  objc_msgSend_smallReductionSumResult(v98, v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v107, (uint64_t)v119, 16);
  if (v73)
  {
    v74 = *(_QWORD *)v108;
    do
    {
      v75 = 0;
      do
      {
        if (*(_QWORD *)v108 != v74)
          objc_enumerationMutation(v69);
        objc_msgSend_synchronizeOnCommandBuffer_(*(void **)(*((_QWORD *)&v107 + 1) + 8 * v75++), v71, (uint64_t)v10, v72);
      }
      while (v73 != v75);
      v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v71, (uint64_t)&v107, (uint64_t)v119, 16);
    }
    while (v73);
  }

  objc_msgSend_layers(self, v76, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v79, v80, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = sub_19C193BF0;
  v99[3] = &unk_1E3D255B8;
  objc_copyWeak(&v105, &location);
  v84 = v36;
  v100 = v84;
  v85 = v12;
  v101 = v85;
  v86 = v83;
  v102 = v86;
  v87 = v96;
  v103 = v87;
  v88 = v97;
  v104 = v88;
  objc_msgSend_addCompletedHandler_(v10, v89, (uint64_t)v99, v90);
  v94 = objc_msgSend_labelsCount(v85, v91, v92, v93);

  objc_destroyWeak(&v105);
  objc_destroyWeak(&location);

  return v94;
}

- (id)computeInference:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  unint64_t i;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  id v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  CFArrayRef v80;
  void *v82;
  void *v83;
  id v84;
  _QWORD v85[4];
  id v86;
  id v87;
  id v88;
  uint64_t *v89;
  uint64_t v90;
  int **v91;
  uint64_t v92;
  __n128 (*v93)(__n128 *, __n128 *);
  void (*v94)(uint64_t);
  void *v95;
  void *__p;
  void *v97;
  uint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v84 = a3;
  objc_msgSend_deviceHandler(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v7, v8, v9, v10);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_deviceHandler(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandQueue(v14, v15, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();

  v83 = (void *)v18;
  objc_msgSend_commandBufferFromCommandQueue_(MEMORY[0x1E0CC6DE0], v19, v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataBatch_batchSize_network_(MLPDataBatch, v22, (uint64_t)v84, 1, self);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matrix(v23, v24, v25, v26);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend_layers(self, v27, v28, v29, v82);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_count(v32, v33, v34, v35);

    if (i >= v36)
      break;
    objc_msgSend_layers(self, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v40, v41, i, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_seqForward_input_dataBatch_runInference_(v43, v44, (uint64_t)v21, (uint64_t)v30, v23, 1);
    v45 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)v45;
  }
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v46 = v30;
  v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v99, (uint64_t)v103, 16);
  if (v51)
  {
    v52 = *(_QWORD *)v100;
    do
    {
      for (j = 0; j != v51; ++j)
      {
        if (*(_QWORD *)v100 != v52)
          objc_enumerationMutation(v46);
        v54 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * j);
        objc_msgSend_deviceHandler(self, v48, v49, v50);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_data(v54, v56, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_importDataFromGPU_cmdBuf_(v55, v60, (uint64_t)v59, (uint64_t)v21);

      }
      v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v48, (uint64_t)&v99, (uint64_t)v103, 16);
    }
    while (v51);
  }

  objc_msgSend_layers(self, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v64, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  v90 = 0;
  v91 = (int **)&v90;
  v92 = 0x4812000000;
  v93 = sub_19C194514;
  v94 = sub_19C194538;
  v95 = &unk_19C2849F1;
  __p = 0;
  v97 = 0;
  v98 = 0;
  v85[0] = MEMORY[0x1E0C809B0];
  v85[1] = 3221225472;
  v85[2] = sub_19C194550;
  v85[3] = &unk_1E3D255E0;
  v69 = v46;
  v86 = v69;
  v70 = v23;
  v87 = v70;
  v89 = &v90;
  v71 = v68;
  v88 = v71;
  objc_msgSend_addCompletedHandler_(v21, v72, (uint64_t)v85, v73);
  objc_msgSend_commit(v21, v74, v75, v76);
  objc_msgSend_waitUntilCompleted(v21, v77, v78, v79);
  v80 = sub_19C194904(v91 + 6);

  _Block_object_dispose(&v90, 8);
  if (__p)
  {
    v97 = __p;
    operator delete(__p);
  }

  return v80;
}

- (void)decayHandler:(id)a3 didUpdateLearningRate:(float)a4
{
  uint64_t v4;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t j;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend_layers(self, a2, (uint64_t)a3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v32, (uint64_t)v37, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend_conformsToProtocol_(v13, v8, (uint64_t)&unk_1EE41D850, v9))
        {
          v14 = v13;
          objc_msgSend_mlpOptimizers(v14, v15, v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v19 = v18;
          v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v28, (uint64_t)v36, 16);
          if (v24)
          {
            v26 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v29 != v26)
                  objc_enumerationMutation(v19);
                *(float *)&v25 = a4;
                objc_msgSend_updateLearningRate_(*(void **)(*((_QWORD *)&v28 + 1) + 8 * j), v21, v22, v23, v25);
              }
              v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v21, (uint64_t)&v28, (uint64_t)v36, 16);
            }
            while (v24);
          }

        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v32, (uint64_t)v37, 16);
    }
    while (v10);
  }

}

- (MLPLearningRateDecayHandler)seqLearningRateDecayHandler
{
  return (MLPLearningRateDecayHandler *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSeqLearningRateDecayHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seqLearningRateDecayHandler, 0);
}

@end
