@implementation MLPCNNNetwork

- (MLPCNNNetwork)initWithLayers:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MLPCNNNetwork;
  return -[MLPNetwork initWithNetworkType:layers:](&v4, sel_initWithNetworkType_layers_, 1, a3);
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
  int v15;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  MontrealNNModelOptimizerParam *v31;
  double v32;
  double v33;
  const char *v34;
  objc_super v35;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend_options(self, v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exMRL_numberForKey_(v8, v9, (uint64_t)MLPModelTrainerLearningRateKey[0], v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v11, v12, v13, v14);
    v16 = v15;

    objc_msgSend_options(self, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exMRL_numberForKey_(v20, v21, (uint64_t)MLPModelTrainerGradientClipMinimum[0], v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_options(self, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exMRL_numberForKey_(v27, v28, (uint64_t)MLPModelTrainerGradientClipMaximum[0], v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = [MontrealNNModelOptimizerParam alloc];
    LODWORD(v32) = 1.0;
    LODWORD(v33) = v16;
    v7 = (id)objc_msgSend_initWithOptimizerType_learningRate_momentum_gradientClipMin_gradientClipMax_(v31, v34, 1, (uint64_t)v23, v30, v33, v32);

  }
  v35.receiver = self;
  v35.super_class = (Class)MLPCNNNetwork;
  -[MLPNetwork setOptimizerParams:](&v35, sel_setOptimizerParams_, v7);

}

- (void)createLayerKernels
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend_layers(self, a2, v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v12, (uint64_t)v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v4);
        objc_msgSend_createKernel(*(void **)(*((_QWORD *)&v12 + 1) + 8 * v11++), v6, v7, v8);
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v12, (uint64_t)v16, 16);
    }
    while (v9);
  }

}

- (void)runTraining:(id)a3 databatch:(id)a4 iteration:(unint64_t)a5 lossCallback:(id)a6 semaphore:(id)a7
{
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  MPSImageBatch *v21;
  unint64_t i;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
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
  unint64_t j;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t k;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  id v93;
  id v94;
  id v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  id v99;
  id v100;
  _QWORD v101[4];
  id v102;
  id v103;
  id v104;
  id v105[2];
  id location;

  v12 = a3;
  v13 = a4;
  v100 = a6;
  v99 = a7;
  v14 = v13;
  objc_msgSend_images(v14, v15, v16, v17);
  v21 = (MPSImageBatch *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend_layers(self, v18, v19, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_count(v23, v24, v25, v26);

    if (i >= v27)
      break;
    v31 = (void *)MEMORY[0x1A1AD2100]();
    objc_msgSend_layers(self, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v35, v36, i, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_lossLabels(v14, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_forward_input_labels_runInference_(v38, v43, (uint64_t)v12, (uint64_t)v21, v42, 0);
    v44 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v31);
    v21 = (MPSImageBatch *)v44;
  }
  for (j = 0; ; ++j)
  {
    objc_msgSend_labels(v14, v28, v29, v30);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend_count(v46, v47, v48, v49);

    if (j >= v50)
      break;
    v54 = (void *)MEMORY[0x1A1AD2100]();
    objc_msgSend_lossLabels(v14, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v58, v59, j, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_lossImage(v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_synchronizeOnCommandBuffer_(v65, v66, (uint64_t)v12, v67);

    objc_autoreleasePoolPop(v54);
  }
  v98 = (void *)a5;
  v68 = 0;
  for (k = -1; ; --k)
  {
    objc_msgSend_layers(self, v51, v52, v53);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend_count(v70, v71, v72, v73);

    if (v68 >= v74)
      break;
    v75 = (void *)MEMORY[0x1A1AD2100]();
    objc_msgSend_layers(self, v76, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend_count(v79, v80, v81, v82);

    objc_msgSend_layers(self, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v87, v88, k + v83, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_backward_inputGradient_(v90, v91, (uint64_t)v12, (uint64_t)v21);
    v92 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v75);
    ++v68;
    v21 = (MPSImageBatch *)v92;
  }
  MPSImageBatchIncrementReadCount(v21, -1);
  objc_initWeak(&location, self);
  v101[0] = MEMORY[0x1E0C809B0];
  v101[1] = 3221225472;
  v101[2] = sub_19C24F9B4;
  v101[3] = &unk_1E3D25978;
  objc_copyWeak(v105, &location);
  v93 = v14;
  v102 = v93;
  v94 = v100;
  v104 = v94;
  v105[1] = v98;
  v95 = v99;
  v103 = v95;
  objc_msgSend_addCompletedHandler_(v12, v96, (uint64_t)v101, v97);

  objc_destroyWeak(v105);
  objc_destroyWeak(&location);

}

- (float)computeLoss:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  float v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  _QWORD v36[2];

  v7 = a3;
  v8 = 0;
  v9 = 0.0;
  while (1)
  {
    objc_msgSend_labels(v7, v4, v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_count(v10, v11, v12, v13);

    if (v8 >= v14)
      break;
    objc_msgSend_lossLabels(v7, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v18, v19, v8, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_lossImage(v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = 0;
    v36[1] = 0;
    objc_msgSend_deviceHandler(self, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_dataLayout(v29, v30, v31, v32);
    objc_msgSend_readBytes_dataLayout_imageIndex_(v25, v34, (uint64_t)v36, v33, 0);

    v9 = *(float *)v36 + v9;
    ++v8;
  }

  return v9;
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
  unint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
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
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  unint64_t i;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  id v95;
  id v96;
  id v97;
  id v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  id v110;
  id v111;
  void *v112;
  id v113;
  _QWORD v114[4];
  id v115;
  id v116;
  id v117;
  id v118;
  MLPCNNNetwork *v119;
  id v120;
  id v121;
  id location;

  v10 = a3;
  v11 = a4;
  v111 = a5;
  v110 = a6;
  v12 = v11;
  objc_msgSend_images(v12, v13, v14, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v112 = 0;
  while (1)
  {
    objc_msgSend_layers(self, v16, v17, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_count(v21, v22, v23, v24);

    if (v20 >= v25)
      break;
    v29 = (void *)MEMORY[0x1A1AD2100]();
    objc_msgSend_layers(self, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_count(v33, v34, v35, v36);

    objc_msgSend_layers(self, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v41, v42, v20, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_lossLabels(v12, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_forward_input_labels_runInference_(v44, v49, (uint64_t)v10, (uint64_t)v19, v48, 1);
    v50 = objc_claimAutoreleasedReturnValue();

    if (v20 == v37 - 1)
    {
      objc_msgSend_deviceHandler(self, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_i2mKernel(self, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_matrixFromImages_i2mKernel_cmdBuf_(v54, v59, v50, (uint64_t)v58, v10);
      v60 = objc_claimAutoreleasedReturnValue();

      v112 = (void *)v60;
    }

    objc_autoreleasePoolPop(v29);
    ++v20;
    v19 = (void *)v50;
  }
  for (i = 0; ; ++i)
  {
    objc_msgSend_labels(v12, v26, v27, v28);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend_count(v62, v63, v64, v65);

    if (i >= v66)
      break;
    v70 = (void *)MEMORY[0x1A1AD2100]();
    objc_msgSend_lossLabels(v12, v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v74, v75, i, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_lossImage(v77, v78, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_synchronizeOnCommandBuffer_(v81, v82, (uint64_t)v10, v83);

    objc_autoreleasePoolPop(v70);
  }
  if (v112)
  {
    objc_msgSend_deviceHandler(self, v67, v68, v69);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(v112, v85, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_importDataFromGPU_cmdBuf_(v84, v89, (uint64_t)v88, (uint64_t)v10);

  }
  objc_msgSend_layers(self, v67, v68, v69);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v90, v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v114[0] = MEMORY[0x1E0C809B0];
  v114[1] = 3221225472;
  v114[2] = sub_19C250094;
  v114[3] = &unk_1E3D259A0;
  objc_copyWeak(&v121, &location);
  v95 = v12;
  v115 = v95;
  v113 = v112;
  v116 = v113;
  v96 = v94;
  v117 = v96;
  v97 = v111;
  v118 = v97;
  v119 = self;
  v98 = v110;
  v120 = v98;
  objc_msgSend_addCompletedHandler_(v10, v99, (uint64_t)v114, v100);
  objc_msgSend_images(v95, v101, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend_count(v104, v105, v106, v107);

  objc_destroyWeak(&v121);
  objc_destroyWeak(&location);

  return v108;
}

- (id)computeInference:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unint64_t i;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
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
  uint64_t v60;
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
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  id v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  CFArrayRef v86;
  void *v88;
  void *v89;
  void *v90;
  _QWORD v91[4];
  id v92;
  uint64_t *v93;
  uint64_t v94;
  int **v95;
  uint64_t v96;
  __n128 (*v97)(__n128 *, __n128 *);
  void (*v98)(uint64_t);
  void *v99;
  void *__p;
  void *v101;
  uint64_t v102;

  v4 = a3;
  objc_msgSend_deviceHandler(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v8, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend_deviceHandler(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandQueue(v16, v17, v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  v90 = (void *)v12;

  objc_msgSend_commandBufferFromCommandQueue_(MEMORY[0x1E0CC6DE0], v21, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v4;
  objc_msgSend_dataBatch_batchSize_network_(MLPDataBatch, v24, (uint64_t)v4, 1, self);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)v20;
  objc_msgSend_images(v25, v26, v27, v28);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  for (i = 0; ; ++i)
  {
    objc_msgSend_layers(self, v29, v30, v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_count(v35, v36, v37, v38);

    if (i >= v39)
      break;
    objc_msgSend_layers(self, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v43, v44, i, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_lossLabels(v25, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_forward_input_labels_runInference_(v46, v51, (uint64_t)v23, (uint64_t)v32, v50, 1);
    v52 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_layers(self, v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend_count(v56, v57, v58, v59) - 1;

    if (i == v60)
    {
      objc_msgSend_deviceHandler(self, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_i2mKernel(self, v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_matrixFromImages_i2mKernel_cmdBuf_(v64, v69, v52, (uint64_t)v68, v23);
      v70 = objc_claimAutoreleasedReturnValue();

      v33 = (void *)v70;
    }

    v32 = (void *)v52;
  }
  if (v33)
  {
    objc_msgSend_deviceHandler(self, v40, v41, v42);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(v33, v72, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_importDataFromGPU_cmdBuf_(v71, v76, (uint64_t)v75, (uint64_t)v23);

  }
  v94 = 0;
  v95 = (int **)&v94;
  v96 = 0x4812000000;
  v97 = sub_19C2509D8;
  v98 = sub_19C2509FC;
  v99 = &unk_19C2849F1;
  __p = 0;
  v101 = 0;
  v102 = 0;
  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = sub_19C250A14;
  v91[3] = &unk_1E3D259C8;
  v77 = v33;
  v92 = v77;
  v93 = &v94;
  objc_msgSend_addCompletedHandler_(v23, v78, (uint64_t)v91, v79);
  objc_msgSend_commit(v23, v80, v81, v82);
  objc_msgSend_waitUntilCompleted(v23, v83, v84, v85);
  v86 = sub_19C194904(v95 + 6);

  _Block_object_dispose(&v94, 8);
  if (__p)
  {
    v101 = __p;
    operator delete(__p);
  }

  return v86;
}

@end
