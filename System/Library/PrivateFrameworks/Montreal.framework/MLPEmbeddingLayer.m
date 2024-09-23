@implementation MLPEmbeddingLayer

- (MLPEmbeddingLayer)initWithName:(id)a3 parameters:(id *)a4
{
  id v6;
  MLPEmbeddingLayer *v7;
  const char *v8;
  uint64_t v9;
  MLPEmbeddingLayer *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MLPEmbeddingLayer;
  v7 = -[MLPLayer initWithLayerType:name:parameters:](&v24, sel_initWithLayerType_name_parameters_, 7, v6, a4);
  v10 = v7;
  if (v7)
  {
    objc_msgSend_setInputLength_(v7, v8, a4->var9[0][0], v9);
    objc_msgSend_setInputChannels_(v10, v11, 1, v12);
    objc_msgSend_setOutputLength_(v10, v13, a4->var9[0][0], v14);
    objc_msgSend_setOutputChannels_(v10, v15, a4->var10[0][0] / a4->var9[0][0], v16);
    objc_msgSend_setVocabSize_(v10, v17, a4->var11[0], v18);
    objc_msgSend_setEmbeddingDimension_(v10, v19, a4->var10[0][0] / a4->var9[0][0], v20);
    objc_msgSend_setInitialWeights_(v10, v21, (uint64_t)a4->var13[0], v22);
  }

  return v10;
}

- (MLPEmbeddingLayer)initWithName:(id)a3 inputLength:(unint64_t)a4 vocabSize:(unint64_t)a5 embeddingDimension:(unint64_t)a6
{
  id v10;
  MLPEmbeddingLayer *v11;
  const char *v12;
  uint64_t v13;
  MLPEmbeddingLayer *v14;
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
  objc_super v26;

  v10 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MLPEmbeddingLayer;
  v11 = -[MLPLayer initWithLayerType:name:neuronType:neuronParams:](&v26, sel_initWithLayerType_name_neuronType_neuronParams_, 7, v10, 0, 0);
  v14 = v11;
  if (v11)
  {
    objc_msgSend_setInputLength_(v11, v12, a4, v13);
    objc_msgSend_setInputChannels_(v14, v15, 1, v16);
    objc_msgSend_setOutputLength_(v14, v17, a4, v18);
    objc_msgSend_setOutputChannels_(v14, v19, a6, v20);
    objc_msgSend_setVocabSize_(v14, v21, a5, v22);
    objc_msgSend_setEmbeddingDimension_(v14, v23, a6, v24);
  }

  return v14;
}

- (NSArray)mlpOptimizers
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_optimizer(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (void)createKernel
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
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
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  id v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  const char *v88;
  uint64_t v89;
  id v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  id v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  _QWORD v116[5];

  objc_msgSend_network(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0CC6F08]);
  v17 = (void *)objc_msgSend_initWithDevice_(v14, v15, (uint64_t)v13, v16);
  objc_msgSend_setForwardKernel_(self, v18, (uint64_t)v17, v19);

  objc_msgSend_network(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_vocabSize(self, v28, v29, v30);
  v35 = objc_msgSend_embeddingDimension(self, v32, v33, v34);
  v39 = objc_msgSend_initialWeights(self, v36, v37, v38);
  LODWORD(v40) = 1017370378;
  objc_msgSend_weightMatrixWithRows_columns_stdDev_initialValues_columnMajor_(v27, v41, v31, v35, v39, 0, v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWeights_(self, v43, (uint64_t)v42, v44);

  objc_msgSend_network(self, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend_vocabSize(self, v53, v54, v55);
  v60 = objc_msgSend_embeddingDimension(self, v57, v58, v59);
  LODWORD(v61) = 0;
  objc_msgSend_weightMatrixWithRows_columns_stdDev_initialValues_columnMajor_(v52, v62, v56, v60, 0, 0, v61);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWeightGradients_(self, v64, (uint64_t)v63, v65);

  v116[0] = MEMORY[0x1E0C809B0];
  v116[1] = 3221225472;
  v116[2] = sub_19C19A938;
  v116[3] = &unk_1E3D25650;
  v116[4] = self;
  v66 = (void *)MEMORY[0x1A1AD22D4](v116);
  objc_msgSend_network(self, v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_optimizerWithNetwork_momentum_velocity_(MLPOptimizer, v71, (uint64_t)v70, (uint64_t)v66, v66);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOptimizer_(self, v73, (uint64_t)v72, v74);

  v75 = objc_alloc(MEMORY[0x1E0CC6F28]);
  v78 = (void *)objc_msgSend_initWithDevice_(v75, v76, (uint64_t)v13, v77);
  objc_msgSend_setZeroFilter_(self, v79, (uint64_t)v78, v80);

  objc_msgSend_zeroFilter(self, v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v85) = 0;
  LODWORD(v86) = 0;
  LODWORD(v87) = 0;
  objc_msgSend_setNeuronType_parameterA_parameterB_parameterC_(v84, v88, 2, v89, v85, v86, v87);

  v90 = objc_alloc(MEMORY[0x1E0CC6EE0]);
  objc_msgSend_weights(self, v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend_columns(v94, v95, v96, v97);
  v100 = (void *)objc_msgSend_initWithDevice_copyRows_copyColumns_sourcesAreTransposed_destinationsAreTransposed_(v90, v99, (uint64_t)v13, 1, v98, 0, 0);
  objc_msgSend_setMatrixCopyFilter_(self, v101, (uint64_t)v100, v102);

  v103 = objc_alloc(MEMORY[0x1E0CC6F48]);
  objc_msgSend_weights(self, v104, v105, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend_columns(v107, v108, v109, v110);
  v113 = (void *)objc_msgSend_initWithDevice_count_rows_columns_transpose_(v103, v112, (uint64_t)v13, 2, 1, v111, 0);
  objc_msgSend_setSumFilter_(self, v114, (uint64_t)v113, v115);

}

- (id)forward:(id)a3 input:(id)a4 labels:(id)a5 runInference:(BOOL)a6
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  unint64_t v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  char *v61;
  char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  float v91;
  void *v92;
  const char *v93;
  void *v94;
  const char *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  id v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  id v138;
  id v139;
  id obj;
  uint64_t v141;
  id v142;
  void *v143;
  uint64_t v144;
  void *v145;
  id v146;
  uint64_t i;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _BYTE v152[128];
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  v146 = a3;
  v139 = a4;
  v138 = a5;
  objc_msgSend_network(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v16, v17, v18, v19);
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_matrixCopy(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    v27 = objc_alloc(MEMORY[0x1E0CC6EE0]);
    v31 = objc_msgSend_embeddingDimension(self, v28, v29, v30);
    v33 = (void *)objc_msgSend_initWithDevice_copyRows_copyColumns_sourcesAreTransposed_destinationsAreTransposed_(v27, v32, (uint64_t)v143, 1, v31, 0, 1);
    objc_msgSend_setMatrixCopy_(self, v34, (uint64_t)v33, v35);

  }
  v36 = (void *)MEMORY[0x1E0C99DE8];
  v37 = objc_msgSend_count(v139, v24, v25, v26);
  objc_msgSend_arrayWithCapacity_(v36, v38, v37, v39);
  v142 = (id)objc_claimAutoreleasedReturnValue();
  v150 = 0u;
  v151 = 0u;
  v148 = 0u;
  v149 = 0u;
  obj = v139;
  v144 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v148, (uint64_t)v152, 16);
  if (v144)
  {
    v141 = *(_QWORD *)v149;
    do
    {
      for (i = 0; i != v144; ++i)
      {
        if (*(_QWORD *)v149 != v141)
          objc_enumerationMutation(obj);
        v44 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * i);
        v45 = objc_msgSend_width(v44, v41, v42, v43);
        v49 = objc_msgSend_height(v44, v46, v47, v48);
        v53 = objc_msgSend_featureChannels(v44, v50, v51, v52);
        v54 = objc_alloc(MEMORY[0x1E0CC6EE8]);
        v55 = v49 * v45 * v53;
        v60 = (void *)objc_msgSend_initWithDevice_count_(v54, v56, (uint64_t)v143, v55);
        if (v55)
        {
          if (v55 >> 62)
            sub_19C07DA0C();
          v61 = (char *)operator new(4 * v55);
          v62 = &v61[4 * v55];
          bzero(v61, 4 * v45 * v49 * v53);
        }
        else
        {
          v62 = 0;
          v61 = 0;
        }
        objc_msgSend_network(self, v57, v58, v59);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_deviceHandler(v63, v64, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend_dataLayout(v67, v68, v69, v70);
        objc_msgSend_readBytes_dataLayout_imageIndex_(v44, v72, (uint64_t)v61, v71, 0);

        objc_msgSend_network(self, v73, v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_deviceHandler(v76, v77, v78, v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend_embeddingDimension(self, v81, v82, v83);
        objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v80, v85, v84, v55, v146);
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        if (v62 != v61)
        {
          v90 = 0;
          do
          {
            v91 = *(float *)&v61[4 * v90];
            objc_msgSend_weights(self, v87, v88, v89);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setCopyOperationAtIndex_sourceMatrix_destinationMatrix_offsets_(v60, v93, v90, (uint64_t)v92, v86, (int)(v91 + 0.5), v90);

            ++v90;
          }
          while (v90 < (v62 - v61) >> 2);
        }
        objc_msgSend_matrixCopy(self, v87, v88, v89);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_encodeToCommandBuffer_copyDescriptor_(v94, v95, (uint64_t)v146, (uint64_t)v60);

        v96 = (void *)MEMORY[0x1E0CC6F00];
        v100 = objc_msgSend_embeddingDimension(self, v97, v98, v99);
        v104 = objc_msgSend_embeddingDimension(self, v101, v102, v103);
        objc_msgSend_matrixDescriptorWithRows_columns_rowBytes_dataType_(v96, v105, 1, v100 * v55, 4 * v55 * v104, 268435488);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = objc_alloc(MEMORY[0x1E0CC6ED8]);
        objc_msgSend_data(v86, v107, v108, v109);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = (void *)objc_msgSend_initWithBuffer_descriptor_(v106, v111, (uint64_t)v110, (uint64_t)v145);

        objc_msgSend_network(self, v113, v114, v115);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_deviceHandler(v116, v117, v118, v119);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_network(self, v121, v122, v123);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_m2iKernel(v124, v125, v126, v127);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v132 = objc_msgSend_embeddingDimension(self, v129, v130, v131);
        objc_msgSend_imageFromMatrix_m2iKernel_cmdBuf_width_height_featureChannels_(v120, v133, (uint64_t)v112, (uint64_t)v128, v146, v55, 1, v132);
        v134 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_addObject_(v142, v135, (uint64_t)v134, v136);
        if (v61)
          operator delete(v61);

      }
      v144 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v148, (uint64_t)v152, 16);
    }
    while (v144);
  }

  return v142;
}

- (id)seqForward:(id)a3 input:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  vector<std::map<unsigned int, std::vector<unsigned int>>, std::allocator<std::map<unsigned int, std::vector<unsigned int>>>> *p_wordIDRepetitions;
  char *end;
  char *begin;
  char *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  unint64_t v52;
  const char *v53;
  char *v54;
  char *v55;
  unint64_t v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  const char *v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t **v102;
  uint64_t **v103;
  uint64_t **v104;
  unsigned int v105;
  uint64_t **v106;
  uint64_t **v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t *v110;
  BOOL v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  _BYTE *v115;
  int v116;
  uint64_t v117;
  int v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  char *v123;
  MLPEmbeddingLayer *v124;
  char *v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  unint64_t v129;
  _BYTE *v130;
  uint64_t *v131;
  uint64_t v132;
  unint64_t v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  _OWORD *v137;
  char *v138;
  uint64_t v139;
  __int128 v140;
  int v141;
  uint64_t *v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  const char *v148;
  uint64_t v149;
  id v151;
  id v152;
  id v153;
  void *v154;
  void *v155;
  id v156;
  void *v157;
  vector<std::map<unsigned int, std::vector<unsigned int>>, std::allocator<std::map<unsigned int, std::vector<unsigned int>>>> *v158;
  unint64_t v159;
  void *v160;
  char *v161;
  char *v162;

  v156 = a3;
  v9 = a4;
  v151 = a5;
  objc_msgSend_network(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = v9;
  objc_msgSend_deviceHandler(v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v17, v18, v19, v20);
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_matrixCopy(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    v28 = objc_alloc(MEMORY[0x1E0CC6EE0]);
    v32 = objc_msgSend_embeddingDimension(self, v29, v30, v31);
    v34 = (void *)objc_msgSend_initWithDevice_copyRows_copyColumns_sourcesAreTransposed_destinationsAreTransposed_(v28, v33, (uint64_t)v154, 1, v32, 0, 0);
    objc_msgSend_setMatrixCopy_(self, v35, (uint64_t)v34, v36);

  }
  v37 = (void *)MEMORY[0x1E0C99DE8];
  v38 = objc_msgSend_count(v9, v25, v26, v27);
  objc_msgSend_arrayWithCapacity_(v37, v39, v38, v40);
  v153 = (id)objc_claimAutoreleasedReturnValue();
  p_wordIDRepetitions = &self->wordIDRepetitions;
  begin = (char *)self->wordIDRepetitions.__begin_;
  end = (char *)self->wordIDRepetitions.__end_;
  if (end != begin)
  {
    do
    {
      v47 = end - 24;
      sub_19C19CD34((uint64_t)(end - 24), *((_QWORD **)end - 2));
      end = v47;
    }
    while (v47 != begin);
  }
  self->wordIDRepetitions.__end_ = begin;
  v48 = objc_msgSend_count(v9, v41, v42, v43);
  v51 = (char *)self->wordIDRepetitions.__end_;
  v52 = 0xAAAAAAAAAAAAAAABLL * ((v51 - (char *)p_wordIDRepetitions->__begin_) >> 3);
  v53 = (const char *)(v48 - v52);
  if (v48 <= v52)
  {
    if (v48 < v52)
    {
      v54 = (char *)p_wordIDRepetitions->__begin_ + 24 * v48;
      if (v51 != v54)
      {
        do
        {
          v55 = v51 - 24;
          sub_19C19CD34((uint64_t)(v51 - 24), *((_QWORD **)v51 - 2));
          v51 = v55;
        }
        while (v55 != v54);
      }
      self->wordIDRepetitions.__end_ = v54;
    }
  }
  else
  {
    sub_19C19CD84(&self->wordIDRepetitions.__begin_, (unint64_t)v53);
  }
  v56 = 0;
  v158 = &self->wordIDRepetitions;
  while (v56 < objc_msgSend_count(v9, v53, v49, v50))
  {
    objc_msgSend_objectAtIndexedSubscript_(v9, v57, v56, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend_rows(v59, v60, v61, v62);
    v64 = objc_alloc(MEMORY[0x1E0CC6EE8]);
    v66 = (void *)objc_msgSend_initWithDevice_count_(v64, v65, (uint64_t)v154, v63);
    objc_msgSend_data(v59, v67, v68, v69);
    v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v74 = (const void *)objc_msgSend_contents(v70, v71, v72, v73);

    v78 = objc_msgSend_rows(v59, v75, v76, v77);
    v82 = v78;
    v161 = 0;
    v162 = 0;
    v155 = v59;
    if (v78)
    {
      if (v78 < 0)
        sub_19C07DA0C();
      v83 = (char *)operator new(4 * v78);
      v84 = &v83[4 * v82];
      v161 = v83;
      memcpy(v83, v74, 4 * v82);
      v162 = v84;
    }
    else
    {
      v83 = 0;
      v84 = 0;
    }
    objc_msgSend_network(self, v79, v80, v81);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deviceHandler(v85, v86, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend_embeddingDimension(self, v90, v91, v92);
    objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v89, v94, v63, v93, v156);
    v160 = (void *)objc_claimAutoreleasedReturnValue();

    if (v84 != v83)
    {
      v98 = 0;
      v159 = v56;
      v157 = v66;
      do
      {
        v99 = (int)(*(float *)&v83[4 * v98] + 0.5);
        v100 = (uint64_t)p_wordIDRepetitions->__begin_ + 24 * v56;
        v102 = (uint64_t **)(v100 + 8);
        v101 = *(uint64_t **)(v100 + 8);
        v103 = (uint64_t **)(v100 + 8);
        v104 = (uint64_t **)(v100 + 8);
        if (v101)
        {
          while (1)
          {
            while (1)
            {
              v104 = (uint64_t **)v101;
              v105 = *((_DWORD *)v101 + 8);
              if (v105 <= v99)
                break;
              v101 = *v104;
              v103 = v104;
              if (!*v104)
                goto LABEL_27;
            }
            if (v105 >= v99)
              break;
            v101 = v104[1];
            if (!v101)
            {
              v103 = v104 + 1;
              goto LABEL_27;
            }
          }
          v107 = v104;
          v123 = (char *)v104[6];
          v122 = (unint64_t)v104[7];
          if ((unint64_t)v123 >= v122)
          {
LABEL_47:
            v124 = self;
            v125 = (char *)v107[5];
            v126 = (v123 - v125) >> 2;
            v127 = v126 + 1;
            if ((unint64_t)(v126 + 1) >> 62)
              sub_19C07DA0C();
            v128 = v122 - (_QWORD)v125;
            if (v128 >> 1 > v127)
              v127 = v128 >> 1;
            if ((unint64_t)v128 >= 0x7FFFFFFFFFFFFFFCLL)
              v129 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v129 = v127;
            if (v129)
            {
              if (v129 >> 62)
                sub_19C07C7FC();
              v130 = operator new(4 * v129);
              v131 = &v130[4 * v126];
              *v131 = v98;
              v132 = (uint64_t)(v131 + 1);
              if (v123 == v125)
                goto LABEL_64;
LABEL_58:
              v133 = v123 - 4 - v125;
              if (v133 < 0x2C)
                goto LABEL_90;
              if ((unint64_t)(v125 - v130) < 0x20)
                goto LABEL_90;
              v134 = (v133 >> 2) + 1;
              v135 = 4 * (v134 & 0x7FFFFFFFFFFFFFF8);
              v136 = &v123[-v135];
              v131 = (_DWORD *)((char *)v131 - v135);
              v137 = &v130[4 * v126 - 16];
              v138 = v123 - 16;
              v139 = v134 & 0x7FFFFFFFFFFFFFF8;
              do
              {
                v140 = *(_OWORD *)v138;
                *(v137 - 1) = *((_OWORD *)v138 - 1);
                *v137 = v140;
                v137 -= 2;
                v138 -= 32;
                v139 -= 8;
              }
              while (v139);
              v123 = v136;
              if (v134 != (v134 & 0x7FFFFFFFFFFFFFF8))
              {
LABEL_90:
                do
                {
                  v141 = *((_DWORD *)v123 - 1);
                  v123 -= 4;
                  *--v131 = v141;
                }
                while (v123 != v125);
              }
            }
            else
            {
              v130 = 0;
              v131 = (_DWORD *)(4 * v126);
              *(_DWORD *)(4 * v126) = v98;
              v132 = 4 * v126 + 4;
              if (v123 != v125)
                goto LABEL_58;
            }
LABEL_64:
            v107[5] = (uint64_t *)v131;
            v107[6] = (uint64_t *)v132;
            v107[7] = (uint64_t *)&v130[4 * v129];
            if (v125)
              operator delete(v125);
            self = v124;
            v66 = v157;
            goto LABEL_74;
          }
        }
        else
        {
LABEL_27:
          v106 = operator new(0x40uLL);
          v107 = (uint64_t **)v106;
          *((_DWORD *)v106 + 8) = v99;
          v106[6] = 0;
          v106[7] = 0;
          v106[5] = 0;
          *v106 = 0;
          v106[1] = 0;
          v106[2] = v104;
          *v103 = v106;
          v108 = **(_QWORD **)v100;
          v109 = v106;
          if (v108)
          {
            *(_QWORD *)v100 = v108;
            v109 = *v103;
          }
          v110 = *v102;
          v111 = v109 == *v102;
          *((_BYTE *)v109 + 24) = v111;
          if (!v111)
          {
            do
            {
              v112 = v109[2];
              if (*(_BYTE *)(v112 + 24))
                break;
              v113 = *(uint64_t **)(v112 + 16);
              v114 = *v113;
              if (*v113 == v112)
              {
                v117 = v113[1];
                if (!v117 || (v118 = *(unsigned __int8 *)(v117 + 24), v115 = (_BYTE *)(v117 + 24), v118))
                {
                  if (*(uint64_t **)v112 == v109)
                  {
                    *(_BYTE *)(v112 + 24) = 1;
                    *((_BYTE *)v113 + 24) = 0;
                    v121 = *(_QWORD *)(v112 + 8);
                    *v113 = v121;
                    if (v121)
                      goto LABEL_44;
                  }
                  else
                  {
                    v119 = *(uint64_t **)(v112 + 8);
                    v120 = *v119;
                    *(_QWORD *)(v112 + 8) = *v119;
                    if (v120)
                    {
                      *(_QWORD *)(v120 + 16) = v112;
                      v113 = *(uint64_t **)(v112 + 16);
                    }
                    v119[2] = (uint64_t)v113;
                    *(_QWORD *)(*(_QWORD *)(v112 + 16) + 8 * (**(_QWORD **)(v112 + 16) != v112)) = v119;
                    *v119 = v112;
                    *(_QWORD *)(v112 + 16) = v119;
                    v113 = (uint64_t *)v119[2];
                    v112 = *v113;
                    *((_BYTE *)v119 + 24) = 1;
                    *((_BYTE *)v113 + 24) = 0;
                    v121 = *(_QWORD *)(v112 + 8);
                    *v113 = v121;
                    if (v121)
LABEL_44:
                      *(_QWORD *)(v121 + 16) = v113;
                  }
                  *(_QWORD *)(v112 + 16) = v113[2];
                  *(_QWORD *)(v113[2] + 8 * (*(_QWORD *)v113[2] != (_QWORD)v113)) = v112;
                  *(_QWORD *)(v112 + 8) = v113;
LABEL_71:
                  v113[2] = v112;
                  break;
                }
              }
              else if (!v114 || (v116 = *(unsigned __int8 *)(v114 + 24), v115 = (_BYTE *)(v114 + 24), v116))
              {
                if (*(uint64_t **)v112 == v109)
                {
                  v145 = v109[1];
                  *(_QWORD *)v112 = v145;
                  if (v145)
                  {
                    *(_QWORD *)(v145 + 16) = v112;
                    v113 = *(uint64_t **)(v112 + 16);
                  }
                  v109[2] = (uint64_t)v113;
                  *(_QWORD *)(*(_QWORD *)(v112 + 16) + 8 * (**(_QWORD **)(v112 + 16) != v112)) = v109;
                  v109[1] = v112;
                  *(_QWORD *)(v112 + 16) = v109;
                  v113 = (uint64_t *)v109[2];
                  *((_BYTE *)v109 + 24) = 1;
                  *((_BYTE *)v113 + 24) = 0;
                  v112 = v113[1];
                  v142 = *(uint64_t **)v112;
                  v113[1] = *(_QWORD *)v112;
                  if (v142)
LABEL_69:
                    v142[2] = (uint64_t)v113;
                }
                else
                {
                  *(_BYTE *)(v112 + 24) = 1;
                  *((_BYTE *)v113 + 24) = 0;
                  v112 = v113[1];
                  v142 = *(uint64_t **)v112;
                  v113[1] = *(_QWORD *)v112;
                  if (v142)
                    goto LABEL_69;
                }
                *(_QWORD *)(v112 + 16) = v113[2];
                *(_QWORD *)(v113[2] + 8 * (*(_QWORD *)v113[2] != (_QWORD)v113)) = v112;
                *(_QWORD *)v112 = v113;
                goto LABEL_71;
              }
              *(_BYTE *)(v112 + 24) = 1;
              v109 = v113;
              *((_BYTE *)v113 + 24) = v113 == v110;
              *v115 = 1;
            }
            while (v113 != v110);
          }
          ++*(_QWORD *)(v100 + 16);
          v123 = (char *)v106[6];
          v122 = v106[7];
          if ((unint64_t)v123 >= v122)
            goto LABEL_47;
        }
        *(_DWORD *)v123 = v98;
        v132 = (uint64_t)(v123 + 4);
LABEL_74:
        v56 = v159;
        v107[6] = (uint64_t *)v132;
        objc_msgSend_weights(self, v95, v96, v97);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setCopyOperationAtIndex_sourceMatrix_destinationMatrix_offsets_(v66, v144, v98, (uint64_t)v143, v160, v99, v98);

        ++v98;
        v83 = v161;
        p_wordIDRepetitions = v158;
      }
      while (v98 < (v162 - v161) >> 2);
    }
    objc_msgSend_matrixCopy(self, v95, v96, v97);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeToCommandBuffer_copyDescriptor_(v146, v147, (uint64_t)v156, (uint64_t)v66);

    objc_msgSend_addObject_(v153, v148, (uint64_t)v160, v149);
    if (v83)
      operator delete(v83);

    ++v56;
    v9 = v152;
  }

  return v153;
}

- (id)seqBackward:(id)a3 dataBatch:(id)a4 inputGradient:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  unint64_t i;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;

  v8 = a3;
  v9 = a4;
  v13 = a5;
  for (i = 0; i < objc_msgSend_count(v13, v10, v11, v12); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(v13, v15, i, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_seqBackward_inputGradientMatrix_matrixIter_(self, v18, (uint64_t)v8, (uint64_t)v17, i);

  }
  return 0;
}

- (void)seqBackward:(id)a3 inputGradientMatrix:(id)a4 matrixIter:(unint64_t)a5
{
  id v8;
  MLPEmbeddingLayer *v9;
  char *begin;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
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
  void *v33;
  const char *v34;
  char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  id v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  _QWORD *v63;
  _QWORD *v64;
  void *v65;
  const char *v66;
  void *v67;
  uint64_t v68;
  const char *v69;
  id v70;
  const char *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  size_t v98;
  id v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  char *v112;
  char *v113;
  BOOL v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  id v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  _QWORD *v162;
  _QWORD *v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  void *v178;
  char *v179;
  _QWORD *v180;
  id v181;
  id v182;
  char *v183;
  char *v184;
  uint64_t v185;
  MLPEmbeddingLayer *v186;
  _QWORD v187[3];
  _QWORD v188[3];

  v188[2] = *MEMORY[0x1E0C80C00];
  v181 = a3;
  v8 = a4;
  v9 = self;
  v182 = v8;
  begin = (char *)self->wordIDRepetitions.__begin_;
  objc_msgSend_network(v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v18, v19, v20, v21);
  v178 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_zeroFilter(v9, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weights(v9, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weightGradients(v9, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeToCommandBuffer_inputMatrix_biasVector_resultMatrix_(v25, v34, (uint64_t)v181, (uint64_t)v29, 0, v33);
  v35 = &begin[24 * a5];

  v184 = v35;
  v41 = *(_QWORD **)v35;
  v40 = v35 + 8;
  v39 = v41;
  if (v41 != v40)
  {
    v42 = 0;
    v43 = 0;
    do
    {
      if (v39[6] - v39[5] == 4)
        ++v42;
      else
        ++v43;
      v44 = (_QWORD *)v39[1];
      if (v44)
      {
        do
        {
          v45 = v44;
          v44 = (_QWORD *)*v44;
        }
        while (v44);
      }
      else
      {
        do
        {
          v45 = (_QWORD *)v39[2];
          v114 = *v45 == (_QWORD)v39;
          v39 = v45;
        }
        while (!v114);
      }
      v39 = v45;
    }
    while (v45 != v40);
    v186 = v9;
    if (v42)
    {
      v46 = objc_alloc(MEMORY[0x1E0CC6EE8]);
      v51 = (void *)objc_msgSend_initWithDevice_count_(v46, v47, (uint64_t)v178, v42);
      v52 = *(_QWORD **)v184;
      if (*(_QWORD **)v184 != v40)
      {
        v53 = 0;
        do
        {
          v54 = v52[6];
          if (v54 - v52[5] == 4)
          {
            v55 = *((unsigned int *)v52 + 8);
            v56 = *(unsigned int *)(v54 - 4);
            objc_msgSend_incrementReadCount(v182, v48, v49, v50);
            v57 = v182;
            objc_msgSend_weightGradients(v186, v58, v59, v60);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setCopyOperationAtIndex_sourceMatrix_destinationMatrix_offsets_(v51, v62, v53++, (uint64_t)v57, v61, v56, v55);

          }
          v63 = (_QWORD *)v52[1];
          if (v63)
          {
            do
            {
              v64 = v63;
              v63 = (_QWORD *)*v63;
            }
            while (v63);
          }
          else
          {
            do
            {
              v64 = (_QWORD *)v52[2];
              v114 = *v64 == (_QWORD)v52;
              v52 = v64;
            }
            while (!v114);
          }
          v52 = v64;
        }
        while (v64 != v40);
      }
      v9 = v186;
      objc_msgSend_matrixCopyFilter(v186, v48, v49, v50);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeToCommandBuffer_copyDescriptor_(v65, v66, (uint64_t)v181, (uint64_t)v51);

    }
    if (v43)
    {
      v67 = (void *)MEMORY[0x1E0CC7250];
      v68 = objc_msgSend_rows(v182, v36, v37, v38);
      objc_msgSend_vectorDescriptorWithLength_dataType_(v67, v69, 4 * v68, 32);
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_alloc(MEMORY[0x1E0CC7248]);
      v72 = (void *)objc_msgSend_initWithDevice_descriptor_(v70, v71, (uint64_t)v178, (uint64_t)v177);
      objc_msgSend_setOffsetVector_(v9, v73, (uint64_t)v72, v74);

      objc_msgSend_offsetVector(v9, v75, v76, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v78, v79, v80, v81);
      v82 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v86 = (char *)objc_msgSend_contents(v82, v83, v84, v85);

      objc_msgSend_offsetVector(v9, v87, v88, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v90, v91, v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend_length(v94, v95, v96, v97);
      bzero(v86, v98);

      v99 = objc_alloc(MEMORY[0x1E0CC6F48]);
      v103 = objc_msgSend_columns(v182, v100, v101, v102);
      v105 = (void *)objc_msgSend_initWithDevice_count_rows_columns_transpose_(v99, v104, (uint64_t)v178, 2, 1, v103, 0);
      objc_msgSend_setSumFilter_(v9, v106, (uint64_t)v105, v107);

      v111 = *(_QWORD **)v184;
      if (*(_QWORD **)v184 != v40)
      {
        v185 = 0;
        v180 = v40;
        v179 = v86 + 8;
        do
        {
          v113 = (char *)v111[5];
          v112 = (char *)v111[6];
          v183 = v112;
          v114 = (unint64_t)(v112 - v113) < 5 || v113 == v112;
          if (!v114)
          {
            v115 = 2 * v185;
            v116 = &v179[16 * v185];
            do
            {
              *((_DWORD *)v116 - 2) = *(_DWORD *)v113;
              *(_DWORD *)v116 = *((_DWORD *)v111 + 8);
              v117 = *((unsigned int *)v111 + 8);
              objc_msgSend_network(v186, v108, v109, v110);
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_deviceHandler(v118, v119, v120, v121);
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_offsetVector(v186, v123, v124, v125);
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_data(v126, v127, v128, v129);
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_sendDataToGPU_(v122, v131, (uint64_t)v130, v132);

              objc_msgSend_sumFilter(v186, v133, v134, v135);
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              v187[0] = v117;
              v187[1] = 0;
              v187[2] = 0;
              objc_msgSend_setResultMatrixOrigin_(v136, v137, (uint64_t)v187, v138);

              objc_msgSend_sumFilter(v186, v139, v140, v141);
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_incrementReadCount(v182, v143, v144, v145);
              v146 = v182;
              v188[0] = v146;
              objc_msgSend_weightGradients(v186, v147, v148, v149);
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              v188[1] = v150;
              objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v151, (uint64_t)v188, 2);
              v152 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_weightGradients(v186, v153, v154, v155);
              v156 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_offsetVector(v186, v157, v158, v159);
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_encodeToCommandBuffer_sourceMatrices_resultMatrix_scaleVector_offsetVector_biasVector_startIndex_(v142, v161, (uint64_t)v181, (uint64_t)v152, v156, 0, v160, 0, v115);

              ++v185;
              v113 += 4;
              v116 += 16;
              v115 += 2;
            }
            while (v113 != v183);
          }
          v162 = (_QWORD *)v111[1];
          if (v162)
          {
            do
            {
              v163 = v162;
              v162 = (_QWORD *)*v162;
            }
            while (v162);
          }
          else
          {
            do
            {
              v163 = (_QWORD *)v111[2];
              v114 = *v163 == (_QWORD)v111;
              v111 = v163;
            }
            while (!v114);
          }
          v111 = v163;
        }
        while (v163 != v180);
      }

      v9 = v186;
    }
  }
  objc_msgSend_optimizer(v9, v36, v37, v38);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weightGradients(v9, v165, v166, v167);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weights(v9, v169, v170, v171);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeToCommandBuffer_inputGradientMatrix_inputValuesMatrix_(v164, v173, (uint64_t)v181, (uint64_t)v168, v172);

  objc_msgSend_resetReadCount(v182, v174, v175, v176);
}

- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
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
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  void *v123;
  const char *v124;
  void *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  void *v143;
  const char *v144;
  void *v145;
  const char *v146;
  void *v147;
  unint64_t *v149;
  void *v150;
  void *v151;
  id v152;
  id v153;
  _QWORD v154[9];
  _QWORD v155[16];
  int v156;
  int v157;
  int v158;
  uint64_t v159;
  _QWORD v160[3];
  void *v161;
  _QWORD v162[3];
  _QWORD v163[3];

  v163[1] = *MEMORY[0x1E0C80C00];
  v152 = a3;
  v153 = a4;
  bzero(v155, 0x2C0uLL);
  v155[4] = 0;
  v155[5] = 0;
  v155[0] = 23;
  objc_msgSend_weights(self, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_rows((void *)v11, v12, v13, v14);
  objc_msgSend_weights(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_columns(v19, v20, v21, v22);
  sub_19C239334(v23 * v15);
  v25 = v24;

  v156 = objc_msgSend_inputLength(self, v26, v27, v28);
  LODWORD(v11) = objc_msgSend_outputLength(self, v29, v30, v31);
  v157 = objc_msgSend_embeddingDimension(self, v32, v33, v34) * v11;
  objc_msgSend_weights(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend_rows(v38, v39, v40, v41);

  objc_msgSend_weights(self, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend_columns(v46, v47, v48, v49);

  objc_msgSend_weights(self, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend_rowBytes(v54, v55, v56, v57);

  objc_msgSend_network(self, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_device(v66, v67, v68, v69);
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_network(self, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v73, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = a5;
  objc_msgSend_commandQueue(v77, v78, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  v151 = v81;
  objc_msgSend_commandBuffer(v81, v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_network(self, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v89, v90, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weights(self, v94, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v97, v98, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_importDataFromGPU_cmdBuf_(v93, v102, (uint64_t)v101, (uint64_t)v85);

  v154[0] = MEMORY[0x1E0C809B0];
  v154[1] = 3221225472;
  v154[2] = sub_19C19C7C0;
  v154[3] = &unk_1E3D25678;
  v154[4] = self;
  v154[5] = v42;
  v154[6] = v50;
  v154[7] = v25;
  v154[8] = v58;
  objc_msgSend_addCompletedHandler_(v85, v103, (uint64_t)v154, v104);
  objc_msgSend_commit(v85, v105, v106, v107);
  objc_msgSend_waitUntilCompleted(v85, v108, v109, v110);
  v159 = v25;
  v158 = objc_msgSend_vocabSize(self, v111, v112, v113);
  v162[0] = &unk_1E3D2E5A0;
  v162[1] = &unk_1E3D2E5A0;
  v114 = (void *)MEMORY[0x1E0CB37E8];
  v118 = objc_msgSend_inputLength(self, v115, v116, v117);
  objc_msgSend_numberWithUnsignedInteger_(v114, v119, v118, v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v162[2] = v121;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v122, (uint64_t)v162, 3);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v163[0] = v123;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v124, (uint64_t)v163, 1);
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  v160[0] = &unk_1E3D2E5A0;
  v126 = (void *)MEMORY[0x1E0CB37E8];
  v130 = objc_msgSend_outputLength(self, v127, v128, v129);
  objc_msgSend_numberWithUnsignedInteger_(v126, v131, v130, v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v160[1] = v133;
  v134 = (void *)MEMORY[0x1E0CB37E8];
  v138 = objc_msgSend_embeddingDimension(self, v135, v136, v137);
  objc_msgSend_numberWithUnsignedInteger_(v134, v139, v138, v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v160[2] = v141;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v142, (uint64_t)v160, 3);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = v143;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v144, (uint64_t)&v161, 1);
  v145 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_generateNode_model_weightIter_params_inputChunks_outputChunks_(self, v146, (uint64_t)v152, (uint64_t)v153, v149, v155, v125, v145);
  v147 = (void *)objc_claimAutoreleasedReturnValue();

  return v147;
}

- (unint64_t)vocabSize
{
  return self->_vocabSize;
}

- (void)setVocabSize:(unint64_t)a3
{
  self->_vocabSize = a3;
}

- (unint64_t)embeddingDimension
{
  return self->_embeddingDimension;
}

- (void)setEmbeddingDimension:(unint64_t)a3
{
  self->_embeddingDimension = a3;
}

- (MPSMatrixCopy)matrixCopy
{
  return (MPSMatrixCopy *)objc_getProperty(self, a2, 200, 1);
}

- (void)setMatrixCopy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (const)initialWeights
{
  return self->_initialWeights;
}

- (void)setInitialWeights:(const void *)a3
{
  self->_initialWeights = a3;
}

- (MPSMatrix)weights
{
  return (MPSMatrix *)objc_getProperty(self, a2, 216, 1);
}

- (void)setWeights:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (MPSMatrix)weightGradients
{
  return (MPSMatrix *)objc_getProperty(self, a2, 224, 1);
}

- (void)setWeightGradients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (MLPOptimizer)optimizer
{
  return (MLPOptimizer *)objc_getProperty(self, a2, 232, 1);
}

- (void)setOptimizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (MPSMatrix)weights_mom
{
  return (MPSMatrix *)objc_getProperty(self, a2, 240, 1);
}

- (void)setWeights_mom:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (MPSMatrix)weights_vel
{
  return (MPSMatrix *)objc_getProperty(self, a2, 248, 1);
}

- (void)setWeights_vel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (MPSMatrixNeuron)zeroFilter
{
  return (MPSMatrixNeuron *)objc_getProperty(self, a2, 256, 1);
}

- (void)setZeroFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (MPSMatrixSum)sumFilter
{
  return (MPSMatrixSum *)objc_getProperty(self, a2, 264, 1);
}

- (void)setSumFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (MPSMatrixCopy)matrixCopyFilter
{
  return (MPSMatrixCopy *)objc_getProperty(self, a2, 272, 1);
}

- (void)setMatrixCopyFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (MPSVector)offsetVector
{
  return (MPSVector *)objc_getProperty(self, a2, 280, 1);
}

- (void)setOffsetVector:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  float *begin;
  vector<std::map<unsigned int, std::vector<unsigned int>>, std::allocator<std::map<unsigned int, std::vector<unsigned int>>>> *p_wordIDRepetitions;
  char *v5;
  char *end;
  void *v7;
  char *v8;

  objc_storeStrong((id *)&self->_offsetVector, 0);
  objc_storeStrong((id *)&self->_matrixCopyFilter, 0);
  objc_storeStrong((id *)&self->_sumFilter, 0);
  objc_storeStrong((id *)&self->_zeroFilter, 0);
  objc_storeStrong((id *)&self->_weights_vel, 0);
  objc_storeStrong((id *)&self->_weights_mom, 0);
  objc_storeStrong((id *)&self->_optimizer, 0);
  objc_storeStrong((id *)&self->_weightGradients, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_matrixCopy, 0);
  begin = self->weightsInitial.__begin_;
  if (begin)
  {
    self->weightsInitial.__end_ = begin;
    operator delete(begin);
  }
  p_wordIDRepetitions = &self->wordIDRepetitions;
  v5 = (char *)self->wordIDRepetitions.__begin_;
  if (v5)
  {
    end = (char *)self->wordIDRepetitions.__end_;
    v7 = self->wordIDRepetitions.__begin_;
    if (end != v5)
    {
      do
      {
        v8 = end - 24;
        sub_19C19CD34((uint64_t)(end - 24), *((_QWORD **)end - 2));
        end = v8;
      }
      while (v8 != v5);
      v7 = p_wordIDRepetitions->__begin_;
    }
    p_wordIDRepetitions->__end_ = v5;
    operator delete(v7);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 20) = 0;
  return self;
}

@end
