@implementation MontrealNNModelNode

- (id)checkForValidity
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[5];

  v35[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend_name(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v5;
  v34[1] = CFSTR("name");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v34, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v7;
  objc_msgSend_nodeStr(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v11;
  v33[1] = CFSTR("nodeStr");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v33, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v13;
  objc_msgSend_inputs(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v17;
  v32[1] = CFSTR("inputs");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v32, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v19;
  objc_msgSend_outputs(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v23;
  v31[1] = CFSTR("outputs");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v24, (uint64_t)v31, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v25;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v26, (uint64_t)v35, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_checkForValidity_(self, v28, (uint64_t)v27, v29);

  return self;
}

- (MontrealNNModelNode)initWithName:(id)a3 nodeStr:(id)a4 activations:(id)a5 properties:(id)a6 weights:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  MontrealNNModelNode *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  MontrealNNModelNode *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *activations;
  NSArray *inputs;
  NSArray *v29;
  NSArray *outputs;
  NSArray *inputsWithDimensions;
  NSArray *outputsWithDimensions;
  id v33;
  objc_super v35;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v35.receiver = self;
  v35.super_class = (Class)MontrealNNModelNode;
  v18 = -[MontrealNNModelNode init](&v35, sel_init);
  v22 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, a3);
    objc_storeStrong((id *)&v22->_nodeStr, a4);
    v26 = objc_msgSend_copy(v15, v23, v24, v25);
    activations = v22->_activations;
    v22->_activations = (NSArray *)v26;

    objc_storeStrong((id *)&v22->_properties, a6);
    objc_storeStrong((id *)&v22->_weights, a7);
    inputs = v22->_inputs;
    v29 = (NSArray *)MEMORY[0x1E0C9AA60];
    v22->_inputs = (NSArray *)MEMORY[0x1E0C9AA60];

    outputs = v22->_outputs;
    v22->_outputs = v29;

    inputsWithDimensions = v22->_inputsWithDimensions;
    v22->_inputsWithDimensions = v29;

    outputsWithDimensions = v22->_outputsWithDimensions;
    v22->_outputsWithDimensions = v29;

    bzero(&v22->_parameters, 0x2C0uLL);
  }
  v33 = (id)objc_msgSend_checkForValidity(v22, v19, v20, v21);

  return v22;
}

- (MontrealNNModelNode)initWithDictionary:(id)a3 tensors:(id)a4 quantization:(id)a5 jsonDir:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  MontrealNNModelQuantization *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  id v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i;
  void *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  id v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t j;
  void *v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
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
  const char *v131;
  uint64_t v132;
  void *v133;
  MontrealNNModelNode *v134;
  id *location;
  id v137;
  id v138;
  id v139;
  id v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  objc_super v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _QWORD v152[3];

  v152[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v140 = a4;
  v11 = a5;
  v12 = a6;
  v149.receiver = self;
  v149.super_class = (Class)MontrealNNModelNode;
  v16 = -[MontrealNNModelNode init](&v149, sel_init);
  if (v16)
  {
    objc_msgSend_exMRL_stringForKey_(v10, v13, (uint64_t)off_1EE418B28, v15);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(v16 + 16);
    *(_QWORD *)(v16 + 16) = v17;

    objc_msgSend_exMRL_arrayForKey_(v10, v19, (uint64_t)off_1EE418B30, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(void **)(v16 + 24);
    *(_QWORD *)(v16 + 24) = v21;

    if (!*(_QWORD *)(v16 + 24))
    {
      objc_msgSend_exMRL_stringForKey_(v10, v23, (uint64_t)off_1EE418B30, v24);
      v25 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v25;
      if (v25)
      {
        v152[0] = v25;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v26, (uint64_t)v152, 1);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = *(void **)(v16 + 24);
        *(_QWORD *)(v16 + 24) = v28;

      }
    }
    objc_msgSend_exMRL_stringForKey_(v10, v23, (uint64_t)off_1EE418B40, v24);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = *(void **)(v16 + 32);
    *(_QWORD *)(v16 + 32) = v30;

    objc_msgSend_exMRL_dictionaryForKey_(v10, v32, (uint64_t)off_1EE418B58, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v34;

    v36 = [MontrealNNModelQuantization alloc];
    v39 = objc_msgSend_initWithDictionary_(v36, v37, *(_QWORD *)(v16 + 40), v38);
    v40 = *(void **)(v16 + 88);
    *(_QWORD *)(v16 + 88) = v39;

    if (!*(_QWORD *)(v16 + 88))
      objc_storeStrong((id *)(v16 + 88), a5);
    sub_19C1A0F44(v10, off_1EE418B48);
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = *(void **)(v16 + 48);
    *(_QWORD *)(v16 + 48) = v41;

    sub_19C1A0F44(v10, off_1EE418B50);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = *(void **)(v16 + 64);
    *(_QWORD *)(v16 + 64) = v43;

    v137 = v12;
    v138 = v11;
    sub_19C1A10E0(v10, off_1EE418B38, v11, v12);
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = *(void **)(v16 + 80);
    *(_QWORD *)(v16 + 80) = v45;

    sub_19C1A0F44(v10, off_1EE418B48);
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = *(void **)(v16 + 56);
    *(_QWORD *)(v16 + 56) = v47;

    v139 = v10;
    sub_19C1A0F44(v10, off_1EE418B50);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = *(void **)(v16 + 72);
    *(_QWORD *)(v16 + 72) = v49;

    objc_msgSend_addObjectsFromArray_(v140, v51, *(_QWORD *)(v16 + 48), v52);
    objc_msgSend_addObjectsFromArray_(v140, v53, *(_QWORD *)(v16 + 64), v54);
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v55, (uint64_t)CFSTR("%@ == %%@"), v56, off_1EE418D98);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)MEMORY[0x1E0C99DE8];
    v62 = objc_msgSend_count(*(void **)(v16 + 48), v59, v60, v61);
    objc_msgSend_arrayWithCapacity_(v58, v63, v62, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v148 = 0u;
    v66 = *(id *)(v16 + 48);
    v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v67, (uint64_t)&v145, (uint64_t)v151, 16);
    if (v68)
    {
      v72 = v68;
      v73 = *(_QWORD *)v146;
      do
      {
        for (i = 0; i != v72; ++i)
        {
          if (*(_QWORD *)v146 != v73)
            objc_enumerationMutation(v66);
          v75 = (void *)MEMORY[0x1E0CB3880];
          objc_msgSend_name(*(void **)(*((_QWORD *)&v145 + 1) + 8 * i), v69, v70, v71);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_predicateWithFormat_(v75, v77, (uint64_t)v57, v78, v76);
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_filteredSetUsingPredicate_(v140, v80, (uint64_t)v79, v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_anyObject(v82, v83, v84, v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_asInput(v86, v87, v88, v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v90, v91, v16, v92);

          objc_msgSend_addObject_(v65, v93, (uint64_t)v86, v94);
        }
        v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v69, (uint64_t)&v145, (uint64_t)v151, 16);
      }
      while (v72);
    }

    location = (id *)v65;
    objc_storeStrong((id *)(v16 + 48), v65);
    v95 = (void *)MEMORY[0x1E0C99DE8];
    v99 = objc_msgSend_count(*(void **)(v16 + 64), v96, v97, v98);
    objc_msgSend_arrayWithCapacity_(v95, v100, v99, v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = 0u;
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    v103 = v16;
    v104 = *(id *)(v16 + 64);
    v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v141, (uint64_t)v150, 16);
    if (v106)
    {
      v110 = v106;
      v111 = *(_QWORD *)v142;
      do
      {
        for (j = 0; j != v110; ++j)
        {
          if (*(_QWORD *)v142 != v111)
            objc_enumerationMutation(v104);
          v113 = (void *)MEMORY[0x1E0CB3880];
          objc_msgSend_name(*(void **)(*((_QWORD *)&v141 + 1) + 8 * j), v107, v108, v109);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_predicateWithFormat_(v113, v115, (uint64_t)v57, v116, v114);
          v117 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_filteredSetUsingPredicate_(v140, v118, (uint64_t)v117, v119);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_anyObject(v120, v121, v122, v123);
          v124 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_asOutput(v124, v125, v126, v127);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v128, v129, v103, v130);

          objc_msgSend_addObject_(v102, v131, (uint64_t)v124, v132);
        }
        v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v107, (uint64_t)&v141, (uint64_t)v150, 16);
      }
      while (v110);
    }

    v16 = v103;
    v133 = *(void **)(v103 + 64);
    *(_QWORD *)(v103 + 64) = v102;

    v11 = v138;
    v10 = v139;
    v12 = v137;
  }
  objc_msgSend_checkForValidity((void *)v16, v13, v14, v15);
  v134 = (MontrealNNModelNode *)objc_claimAutoreleasedReturnValue();

  return v134;
}

- (id)auditAndUpdateTensors:(id)a3 dimensionTensors:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = v5;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v33, (uint64_t)v37, 16);
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        while (1)
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(v11);
          v25 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((objc_msgSend_containsObject_(v6, v14, v25, v15, (_QWORD)v33) & 1) == 0)
            break;
          v19 = objc_msgSend_indexOfObject_(v6, v26, v25, v27);
          objc_msgSend_objectAtIndex_(v6, v20, v19, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v10, v23, (uint64_t)v22, v24);

          if (v16 == ++i)
            goto LABEL_3;
        }
        objc_msgSend_addObject_(v10, v26, v25, v27);
      }
LABEL_3:
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v33, (uint64_t)v37, 16);
    }
    while (v16);
  }

  v31 = (void *)objc_msgSend_copy(v10, v28, v29, v30);
  return v31;
}

- (void)setInputs:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  NSArray *v14;
  NSArray *inputsWithDimensions;
  id v16;

  objc_storeStrong((id *)&self->_inputs, a3);
  v5 = a3;
  objc_msgSend_inputs(self, v6, v7, v8);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputsWithDimensions(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_auditAndUpdateTensors_dimensionTensors_(self, v13, (uint64_t)v16, (uint64_t)v12);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  inputsWithDimensions = self->_inputsWithDimensions;
  self->_inputsWithDimensions = v14;

}

- (void)setOutputs:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  NSArray *v14;
  NSArray *outputsWithDimensions;
  id v16;

  objc_storeStrong((id *)&self->_outputs, a3);
  v5 = a3;
  objc_msgSend_outputs(self, v6, v7, v8);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_outputsWithDimensions(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_auditAndUpdateTensors_dimensionTensors_(self, v13, (uint64_t)v16, (uint64_t)v12);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  outputsWithDimensions = self->_outputsWithDimensions;
  self->_outputsWithDimensions = v14;

}

- (void)keepTensors:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  NSArray *v7;
  NSArray *inputs;
  NSArray *v9;
  NSArray *outputs;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_19C17E600;
  v11[3] = &unk_1E3D25518;
  v12 = v4;
  v5 = v4;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AD22D4](v11);
  ((void (**)(_QWORD, NSArray *))v6)[2](v6, self->_inputs);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  inputs = self->_inputs;
  self->_inputs = v7;

  ((void (**)(_QWORD, NSArray *))v6)[2](v6, self->_outputs);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  outputs = self->_outputs;
  self->_outputs = v9;

}

- ($2F5DD3F8DC6DFA190B2787CD1D3A833E)parameters:(SEL)a3
{
  uint64_t v4;
  const char *v8;
  uint64_t v9;
  uint64_t v11[88];

  if ((objc_msgSend_parametersSet(self, a3, (uint64_t)a4, v4) & 1) == 0)
  {
    sub_19C247CD0(self, (uint64_t)a4, v11);
    memcpy(&self->_parameters, v11, sizeof(self->_parameters));
    objc_msgSend_setParametersSet_(self, v8, 1, v9);
  }
  return ($2F5DD3F8DC6DFA190B2787CD1D3A833E *)memcpy(retstr, &self->_parameters, sizeof($2F5DD3F8DC6DFA190B2787CD1D3A833E));
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
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
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  id v68;

  v6 = a4;
  v7 = a3;
  objc_msgSend_name(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v12, (uint64_t)CFSTR("\r %@ Name = %@ "), v13, v6, v11);

  objc_msgSend_nodeStr(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v18, (uint64_t)CFSTR("\r %@ Node Type = %@ "), v19, v6, v17);

  objc_msgSend_activations(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C1A09F8(v23, v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v25, (uint64_t)CFSTR("\r %@ Activation Type = %@ "), v26, v6, v24);

  objc_msgSend_inputsWithDimensions(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C1A09F8(v30, v6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v32, (uint64_t)CFSTR("\r %@ Inputs With Dimensions = %@ "), v33, v6, v31);

  objc_msgSend_outputsWithDimensions(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C1A09F8(v37, v6);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v39, (uint64_t)CFSTR("\r %@ Outputs With Dimension = %@ "), v40, v6, v38);

  objc_msgSend_inputs(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C1A09F8(v44, v6);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v46, (uint64_t)CFSTR("\r %@ Inputs = %@ "), v47, v6, v45);

  objc_msgSend_outputs(self, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C1A09F8(v51, v6);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v53, (uint64_t)CFSTR("\r %@ Outputs = %@ "), v54, v6, v52);

  objc_msgSend_weights(self, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C1A09F8(v58, v6);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v60, (uint64_t)CFSTR("\r %@ Weights = %@ "), v61, v6, v59);

  objc_msgSend_properties(self, v62, v63, v64);
  v68 = (id)objc_claimAutoreleasedReturnValue();
  sub_19C1A0C54(v68, v6);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v7, v66, (uint64_t)CFSTR("\r %@ Properties = %@ "), v67, v6, v65);

}

- (id)jsonDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nodeStr(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v10, (uint64_t)v9, (uint64_t)off_1EE418B28);

  objc_msgSend_activations(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v15, (uint64_t)v14, (uint64_t)off_1EE418B30);

  objc_msgSend_name(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v20, (uint64_t)v19, (uint64_t)off_1EE418B40);

  objc_msgSend_properties(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v25, (uint64_t)v24, (uint64_t)off_1EE418B58);

  objc_msgSend_weights(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C1A12B0(v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v31, (uint64_t)v30, (uint64_t)off_1EE418B38);

  objc_msgSend_inputsWithDimensions(self, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C1A12B0(v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v37, (uint64_t)v36, (uint64_t)off_1EE418B48);

  objc_msgSend_outputsWithDimensions(self, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C1A12B0(v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v43, (uint64_t)v42, (uint64_t)off_1EE418B50);

  v47 = (void *)objc_msgSend_copy(v5, v44, v45, v46);
  return v47;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  char isEqual;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend_name(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v5, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    isEqual = objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15);
  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend_name(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (void)generateJSONAtPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend_weights(self, v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v10)
  {
    v13 = v10;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v8);
        objc_msgSend_generateJSONAtPath_(*(void **)(*((_QWORD *)&v16 + 1) + 8 * v15++), v11, (uint64_t)v4, v12);
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v16, (uint64_t)v20, 16);
    }
    while (v13);
  }

}

- (id)createDataContainer
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
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend_weights(self, v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v11)
  {
    v15 = v11;
    v16 = *(_QWORD *)v27;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v9);
        objc_msgSend_createDataContainer(*(void **)(*((_QWORD *)&v26 + 1) + 8 * v17), v12, v13, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addEntriesFromDictionary_(v5, v19, (uint64_t)v18, v20);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v26, (uint64_t)v30, 16);
    }
    while (v15);
  }

  v24 = (void *)objc_msgSend_copy(v5, v21, v22, v23);
  return v24;
}

- (BOOL)isValid
{
  return self->_parameters.nodeType >= 0;
}

- ($2F5DD3F8DC6DFA190B2787CD1D3A833E)parameters
{
  $2F5DD3F8DC6DFA190B2787CD1D3A833E *result;

  objc_copyStruct(retstr, &self->_parameters, 704, 1, 0);
  return result;
}

- (void)setParameters:(id *)a3
{
  objc_copyStruct(&self->_parameters, a3, 704, 1, 0);
}

- (NSString)nodeStr
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)activations
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)properties
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (NSArray)inputsWithDimensions
{
  return self->_inputsWithDimensions;
}

- (void)setInputsWithDimensions:(id)a3
{
  objc_storeStrong((id *)&self->_inputsWithDimensions, a3);
}

- (NSArray)outputs
{
  return self->_outputs;
}

- (NSArray)outputsWithDimensions
{
  return self->_outputsWithDimensions;
}

- (void)setOutputsWithDimensions:(id)a3
{
  objc_storeStrong((id *)&self->_outputsWithDimensions, a3);
}

- (NSArray)weights
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (MontrealNNModelQuantization)quantization
{
  return (MontrealNNModelQuantization *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)parametersSet
{
  return self->_parametersSet;
}

- (void)setParametersSet:(BOOL)a3
{
  self->_parametersSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantization, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_outputsWithDimensions, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputsWithDimensions, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_activations, 0);
  objc_storeStrong((id *)&self->_nodeStr, 0);
}

@end
