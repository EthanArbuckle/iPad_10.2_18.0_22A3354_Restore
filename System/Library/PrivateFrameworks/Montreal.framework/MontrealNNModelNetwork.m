@implementation MontrealNNModelNetwork

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
  void *v21;
  const char *v22;
  uint64_t v23;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend_nodes(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v5;
  v27[1] = CFSTR("nodes");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v27, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v7;
  objc_msgSend_inputs(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v11;
  v26[1] = CFSTR("inputs");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v26, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v13;
  objc_msgSend_outputs(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v17;
  v25[1] = CFSTR("outputs");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v18, (uint64_t)v25, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v19;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v20, (uint64_t)v28, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_checkForValidity_(self, v22, (uint64_t)v21, v23);

  return self;
}

- (MontrealNNModelNetwork)init
{
  MontrealNNModelNetwork *v2;
  MontrealNNModelNetwork *v3;
  NSArray *nodes;
  NSArray *v5;
  NSArray *inputs;
  NSArray *outputs;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MontrealNNModelNetwork;
  v2 = -[MontrealNNModelNetwork init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    nodes = v2->_nodes;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_nodes = (NSArray *)MEMORY[0x1E0C9AA60];

    inputs = v3->_inputs;
    v3->_inputs = v5;

    outputs = v3->_outputs;
    v3->_outputs = v5;

  }
  return v3;
}

- (MontrealNNModelNetwork)initWithJSONDir:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  MontrealNNModelNetwork *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  MontrealNNModelQuantization *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  MontrealNNModelOptimizerParam *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  MontrealNNModelNetwork *v52;
  void *v54;
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)MontrealNNModelNetwork;
  v8 = -[MontrealNNModelNetwork init](&v55, sel_init);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("%@/network.json"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithContentsOfFile_(v9, v11, (uint64_t)v10, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v54 = (void *)v13;
    objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v14, v13, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      sub_19C09C77C(CFSTR("Failed to extract network JSON"), (uint64_t)v16, v17, v18, v19, v20, v21, v22, (uint64_t)v4);
    v23 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v16, (uint64_t)CFSTR("%@/description.json"), v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithContentsOfFile_(v23, v25, (uint64_t)v24, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v28, (uint64_t)v27, 0, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      sub_19C09C77C(CFSTR("Failed to extract description JSON"), v30, v31, v32, v33, v34, v35, v36, (uint64_t)v4);
    v37 = v29;
    v38 = [MontrealNNModelQuantization alloc];
    v41 = (void *)objc_msgSend_initWithDictionary_(v38, v39, (uint64_t)v37, v40);
    v42 = [MontrealNNModelOptimizerParam alloc];
    v45 = (void *)objc_msgSend_initWithDictionary_(v42, v43, (uint64_t)v37, v44);
    objc_msgSend_set(MEMORY[0x1E0C99E20], v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend_initWithDictionary_tensors_quantization_optimizerParams_jsonDir_optimization_(v8, v50, (uint64_t)v15, (uint64_t)v49, v41, v45, v4, 0);

  }
  else
  {
    v51 = 0;
  }
  objc_msgSend_checkForValidity(v51, v5, v6, v7);
  v52 = (MontrealNNModelNetwork *)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (MontrealNNModelNetwork)initWithModelContainer:(void *)a3 tensors:(id)a4
{
  id v6;
  void *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  MontrealNNModelOptimizerParam *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  MontrealNNModelNetwork *v29;
  const char *v30;
  MontrealNNModelNetwork *v31;
  uint64_t v33;

  v6 = a4;
  v7 = (void *)off_1EE41AA20(a3, 0);
  objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v8, (uint64_t)v7, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    sub_19C09C77C(CFSTR("Failed to extract network JSON from model container"), v10, v11, v12, v13, v14, v15, v16, v33);
  v17 = (void *)off_1EE41AA10(a3);
  v18 = [MontrealNNModelOptimizerParam alloc];
  v21 = (void *)objc_msgSend_initWithDictionary_(v18, v19, (uint64_t)v17, v20);
  objc_msgSend_exMRL_numberForKey_(v17, v22, (uint64_t)off_1EE418E20, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_unsignedIntegerValue(v24, v25, v26, v27);

  v29 = [MontrealNNModelNetwork alloc];
  v31 = (MontrealNNModelNetwork *)objc_msgSend_initWithDictionary_tensors_quantization_optimizerParams_jsonDir_optimization_(v29, v30, (uint64_t)v9, (uint64_t)v6, 0, v21, 0, v28);

  return v31;
}

- (MontrealNNModelNetwork)initWithDictionary:(id)a3 tensors:(id)a4 quantization:(id)a5 optimizerParams:(id)a6 jsonDir:(id)a7 optimization:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  MontrealNNModelNetwork *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  MontrealNNModelNetwork *v22;
  MontrealNNModelNetwork *v23;
  uint64_t v24;
  NSArray *nodes;
  uint64_t v26;
  NSArray *inputs;
  uint64_t v28;
  NSArray *outputs;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  MontrealNNModelNetwork *v38;
  objc_super v40;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v40.receiver = self;
  v40.super_class = (Class)MontrealNNModelNetwork;
  v18 = -[MontrealNNModelNetwork init](&v40, sel_init);
  v22 = v18;
  v23 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_optimizerParams, a6);
    objc_storeStrong((id *)&v22->_jsonDir, a7);
    sub_19C1A13F4(v13, off_1EE418DB0, v14, v15, v17);
    v24 = objc_claimAutoreleasedReturnValue();
    nodes = v23->_nodes;
    v23->_nodes = (NSArray *)v24;

    sub_19C1A0F44(v13, off_1EE418DA8);
    v26 = objc_claimAutoreleasedReturnValue();
    inputs = v23->_inputs;
    v23->_inputs = (NSArray *)v26;

    sub_19C1A0F44(v13, off_1EE418B50);
    v28 = objc_claimAutoreleasedReturnValue();
    outputs = v23->_outputs;
    v23->_outputs = (NSArray *)v28;

    objc_msgSend_validateNetworkTensors_(v23, v30, (uint64_t)v14, v31);
    objc_msgSend_collapseNodes(v23, v32, v33, v34);
    objc_msgSend_validateNodeTensors(v23, v35, v36, v37);
  }
  objc_msgSend_checkForValidity(v23, v19, v20, v21);
  v38 = (MontrealNNModelNetwork *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (void)validateNetworkTensors:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSArray *v9;
  NSArray *inputs;
  NSArray *v11;
  NSArray *outputs;
  id v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("%@ == %%@"), v6, off_1EE418D98);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v4;
  v14 = v13;
  v8 = v7;
  v15 = v8;
  sub_19C2288A8((uint64_t)&v14, self->_inputs);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  inputs = self->_inputs;
  self->_inputs = v9;

  sub_19C2288A8((uint64_t)&v14, self->_outputs);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  outputs = self->_outputs;
  self->_outputs = v11;

}

- (void)collapseNodes
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  int isEqualToString;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  char v40;
  char v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSArray *v45;
  const char *v46;
  uint64_t v47;
  NSArray *nodes;
  void *v49;
  NSArray *obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  do
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = self->_nodes;
    v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v52, (uint64_t)v56, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v53;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v53 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend_nodeStr(v11, v5, v6, v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v12, v13, (uint64_t)off_1EE418C30, v14);

          if (isEqualToString)
          {
            objc_msgSend_collapsePackUnpack_nodesToRemove_(self, v16, (uint64_t)v11, (uint64_t)v49);
            goto LABEL_21;
          }
          objc_msgSend_nodeStr(v11, v16, v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isEqualToString_(v19, v20, (uint64_t)off_1EE418C48, v21) & 1) != 0)
            goto LABEL_19;
          objc_msgSend_nodeStr(v11, v22, v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isEqualToString_(v25, v26, (uint64_t)off_1EE418C50, v27) & 1) != 0)
            goto LABEL_18;
          objc_msgSend_nodeStr(v11, v28, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqualToString_(v31, v32, (uint64_t)off_1EE418C38, v33))
          {

LABEL_18:
LABEL_19:

LABEL_20:
            objc_msgSend_removeView_nodesToRemove_(self, v5, (uint64_t)v11, (uint64_t)v49);
LABEL_21:
            v41 = 1;
            goto LABEL_22;
          }
          objc_msgSend_nodeStr(v11, v34, v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend_isEqualToString_(v37, v38, (uint64_t)off_1EE418C40, v39);

          if ((v40 & 1) != 0)
            goto LABEL_20;
        }
        v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v52, (uint64_t)v56, 16);
        v41 = 0;
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v41 = 0;
    }
LABEL_22:

    v45 = (NSArray *)objc_msgSend_mutableCopy(self->_nodes, v42, v43, v44);
    objc_msgSend_removeObjectsInArray_(v45, v46, (uint64_t)v49, v47);
    nodes = self->_nodes;
    self->_nodes = v45;

  }
  while ((v41 & 1) != 0);
}

- (void)validateNodeTensors
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  NSArray *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
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
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSArray *v44;
  NSArray *nodes;
  NSArray *v46;
  NSArray *inputs;
  NSArray *v48;
  NSArray *outputs;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_mutableCopy(self->_nodes, a2, v2, v3);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v6 = self->_nodes;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v50, (uint64_t)v54, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v51 != v12)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend_inputs(v14, v8, v9, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        sub_19C229018(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setInputs_(v14, v17, (uint64_t)v16, v18);

        objc_msgSend_outputs(v14, v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        sub_19C229018(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setOutputs_(v14, v24, (uint64_t)v23, v25);

        objc_msgSend_inputs(v14, v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_count(v29, v30, v31, v32))
        {

LABEL_5:
          objc_msgSend_removeObject_(v5, v8, (uint64_t)v14, v10);
          continue;
        }
        objc_msgSend_outputs(v14, v33, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend_count(v36, v37, v38, v39) == 0;

        if (v40)
          goto LABEL_5;
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v50, (uint64_t)v54, 16);
    }
    while (v11);
  }

  v44 = (NSArray *)objc_msgSend_copy(v5, v41, v42, v43);
  nodes = self->_nodes;
  self->_nodes = v44;

  sub_19C229018(self->_inputs);
  v46 = (NSArray *)objc_claimAutoreleasedReturnValue();
  inputs = self->_inputs;
  self->_inputs = v46;

  sub_19C229018(self->_outputs);
  v48 = (NSArray *)objc_claimAutoreleasedReturnValue();
  outputs = self->_outputs;
  self->_outputs = v48;

}

- (void)collapsePackUnpack:(id)a3 nodesToRemove:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
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
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  _QWORD v130[2];

  v130[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend_inputs(v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v10, v11, v12, v13))
  {

    goto LABEL_5;
  }
  objc_msgSend_outputs(v5, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_count(v17, v18, v19, v20);

  if (!v21)
LABEL_5:
    sub_19C09C77C(CFSTR("Node %@ contains empty inputs or outputs"), (uint64_t)v22, v23, v24, v25, v26, v27, v28, (uint64_t)v5);
  objc_msgSend_inputs(v5, v22, v23, v24);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v29, v30, 0, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_outputs(v5, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v36, v37, 0, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_asInput(v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_anyObject(v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v47)
    sub_19C09C77C(CFSTR("Node %@ output is going nowhere?"), (uint64_t)v48, v49, v50, v51, v52, v53, v54, 0);
  objc_msgSend_outputs(v47, v48, v49, v50);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend_count(v55, v56, v57, v58);

  if (!v59)
    sub_19C09C77C(CFSTR("Node %@ contains empty outputs"), (uint64_t)v60, v61, v62, v63, v64, v65, v66, (uint64_t)v47);
  objc_msgSend_outputs(v47, v60, v61, v62);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v67, v68, 0, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_asInput(v70, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_anyObject(v74, v75, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v78)
    sub_19C09C77C(CFSTR("No unpack node?"), (uint64_t)v79, v80, v81, v82, v83, v84, v85, v128);
  objc_msgSend_outputs(v78, v79, v80, v81);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v86, v87, 0, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  v130[0] = v32;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v90, (uint64_t)v130, 1);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInputs_(v47, v92, (uint64_t)v91, v93);

  objc_msgSend_asInput(v32, v94, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v97, v98, v99, v100);

  objc_msgSend_asInput(v32, v101, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v104, v105, (uint64_t)v47, v106);

  v129 = v89;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v107, (uint64_t)&v129, 1);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOutputs_(v47, v109, (uint64_t)v108, v110);

  objc_msgSend_asOutput(v89, v111, v112, v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v114, v115, v116, v117);

  objc_msgSend_asOutput(v89, v118, v119, v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v121, v122, (uint64_t)v47, v123);

  objc_msgSend_addObject_(v6, v124, (uint64_t)v5, v125);
  objc_msgSend_addObject_(v6, v126, (uint64_t)v78, v127);

}

- (void)removeView:(id)a3 nodesToRemove:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
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
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  id v86;

  v86 = a3;
  v5 = a4;
  objc_msgSend_inputs(v86, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v9, v10, v11, v12))
  {

    goto LABEL_5;
  }
  objc_msgSend_outputs(v86, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_count(v16, v17, v18, v19);

  if (!v20)
LABEL_5:
    sub_19C09C77C(CFSTR("Node %@ contains empty inputs or outputs"), (uint64_t)v21, v22, v23, v24, v25, v26, v27, (uint64_t)v86);
  objc_msgSend_inputs(v86, v21, v22, v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v28, v29, 0, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_outputs(v86, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v35, v36, 0, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_asInput(v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_anyObject(v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v46)
    sub_19C09C77C(CFSTR("Node %@ output is going nowhere?"), (uint64_t)v47, v48, v49, v50, v51, v52, v53, (uint64_t)v86);
  objc_msgSend_inputs(v46, v47, v48, v49);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend_mutableCopy(v54, v55, v56, v57);

  v61 = objc_msgSend_indexOfObject_(v58, v59, (uint64_t)v38, v60);
  objc_msgSend_removeObjectAtIndex_(v58, v62, v61, v63);
  objc_msgSend_insertObject_atIndex_(v58, v64, (uint64_t)v31, v61);
  v68 = (void *)objc_msgSend_copy(v58, v65, v66, v67);
  objc_msgSend_setInputs_(v46, v69, (uint64_t)v68, v70);

  objc_msgSend_asInput(v31, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v74, v75, v76, v77);

  objc_msgSend_asInput(v31, v78, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v81, v82, (uint64_t)v46, v83);

  objc_msgSend_addObject_(v5, v84, (uint64_t)v86, v85);
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  id v28;

  v28 = a3;
  v6 = a4;
  objc_msgSend_inputs(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C1A09F8(v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v28, v12, (uint64_t)CFSTR("\r %@ Inputs = %@ "), v13, v6, v11);

  objc_msgSend_outputs(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C1A09F8(v17, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v28, v19, (uint64_t)CFSTR("\r %@ Outputs = %@ "), v20, v6, v18);

  objc_msgSend_nodes(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C1A09F8(v24, v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v28, v26, (uint64_t)CFSTR("\r %@ Nodes = %@ "), v27, v6, v25);

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
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nodes(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C1A12B0(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v11, (uint64_t)v10, (uint64_t)off_1EE418DB0);

  objc_msgSend_inputs(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C1A12B0(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v17, (uint64_t)v16, (uint64_t)off_1EE418B48);

  objc_msgSend_outputs(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  sub_19C1A12B0(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v23, (uint64_t)v22, (uint64_t)off_1EE418B50);

  v27 = (void *)objc_msgSend_copy(v5, v24, v25, v26);
  return v27;
}

- (void)generateJSONAtPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_jsonDescription(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E0CB36D8], v9, (uint64_t)v8, 1, &v38);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v38;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v12, (uint64_t)CFSTR("%@/network.json"), v13, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeToFile_atomically_(v10, v15, (uint64_t)v14, 1);

  v37 = v11;
  objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E0CB36D8], v16, MEMORY[0x1E0C9AA70], 1, &v37);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v37;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v19, (uint64_t)CFSTR("%@/description.json"), v20, v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeToFile_atomically_(v17, v22, (uint64_t)v21, 1);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend_nodes(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v33, (uint64_t)v39, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v34;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v34 != v31)
          objc_enumerationMutation(v26);
        objc_msgSend_generateJSONAtPath_(*(void **)(*((_QWORD *)&v33 + 1) + 8 * v32++), v28, (uint64_t)v4, v29);
      }
      while (v30 != v32);
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v28, (uint64_t)&v33, (uint64_t)v39, 16);
    }
    while (v30);
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
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend_nodes(self, v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v26;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v9);
        objc_msgSend_createDataContainer(*(void **)(*((_QWORD *)&v25 + 1) + 8 * v16), v11, v12, v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addEntriesFromDictionary_(v5, v18, (uint64_t)v17, v19);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v14);
  }

  v23 = (void *)objc_msgSend_copy(v5, v20, v21, v22);
  return v23;
}

- (void)generateModelContainer
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
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t i;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  uint64_t (*v32)(uint64_t, uint64_t, uint64_t, void *, void *, _QWORD);
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  __CFString *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_jsonDescription(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E0CB36D8], v6, (uint64_t)v5, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v11, v12, (uint64_t)v7, v13);
  objc_msgSend_createDataContainer(self, v14, v15, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 1; objc_msgSend_count(v20, v17, v18, v19) >= i; ++i)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v22, i, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exMRL_dataForKey_(v20, v25, (uint64_t)v24, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_addObject_(v11, v28, (uint64_t)v27, v29);
  }
  sub_19C16CD74();
  v39 = off_1EE418E20;
  v40[0] = &unk_1E3D2E5E8;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v30, (uint64_t)v40, (uint64_t)&v39, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, void *, _QWORD))off_1EE41A9E0;
  v36 = (void *)objc_msgSend_copy(v11, v33, v34, v35);
  v37 = (void *)v32(2, 7, 1, v31, v36, 0);

  return v37;
}

- (NSArray)nodes
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)inputs
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInputs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)outputs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOutputs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (MontrealNNModelQuantization)quantization
{
  return (MontrealNNModelQuantization *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)jsonDir
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (MontrealNNModelOptimizerParam)optimizerParams
{
  return (MontrealNNModelOptimizerParam *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optimizerParams, 0);
  objc_storeStrong((id *)&self->_jsonDir, 0);
  objc_storeStrong((id *)&self->_quantization, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

@end
