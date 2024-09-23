@implementation MontrealNNGenerateModel

- (MontrealNNGenerateModel)initWithWeightFormat:(unint64_t)a3
{
  MontrealNNGenerateModel *v4;
  MontrealNNGenerateModel *v5;
  MontrealNNModelNetwork *v6;
  MontrealNNModelNetwork *network;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableDictionary *inputs;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableDictionary *outputs;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MontrealNNGenerateModel;
  v4 = -[MontrealNNGenerateModel init](&v19, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_weightFormat = a3;
    v6 = objc_alloc_init(MontrealNNModelNetwork);
    network = v5->_network;
    v5->_network = v6;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    inputs = v5->_inputs;
    v5->_inputs = (NSMutableDictionary *)v11;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    outputs = v5->_outputs;
    v5->_outputs = (NSMutableDictionary *)v16;

    sub_19C16CD74();
  }
  return v5;
}

- (void)dealloc
{
  MontrealNeuralNetwork *nnObject;
  objc_super v4;

  nnObject = self->_nnObject;
  if (nnObject)
  {
    CFRelease(nnObject);
    self->_nnObject = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MontrealNNGenerateModel;
  -[MontrealNNGenerateModel dealloc](&v4, sel_dealloc);
}

- (void)setNnObject:(MontrealNeuralNetwork *)a3
{
  self->_nnObject = a3;
}

- (MontrealNeuralNetwork)nnObject
{
  MontrealNeuralNetwork *result;

  result = self->_nnObject;
  if (!result)
  {
    result = (MontrealNeuralNetwork *)MRLNeuralNetworkCreate(0);
    self->_nnObject = result;
  }
  return result;
}

- (void)merge:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  char v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  id v51;

  v51 = a3;
  objc_msgSend_network(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nodes(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_node(v51, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_containsObject_(v11, v16, (uint64_t)v15, v17);

  if ((v18 & 1) != 0)
    sub_19C09C77C(CFSTR("Failed to merge %@ to the network as there is one which already exists with the same name"), (uint64_t)v19, v20, v21, v22, v23, v24, v25, (uint64_t)v51);
  objc_msgSend_network(self, v19, v20, v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_nodes(v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend_mutableCopy(v30, v31, v32, v33);

  objc_msgSend_node(v51, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v34, v39, (uint64_t)v38, v40);

  v44 = (void *)objc_msgSend_copy(v34, v41, v42, v43);
  objc_msgSend_network(self, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNodes_(v48, v49, (uint64_t)v44, v50);

}

- (void)generateModelContainer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
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
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *ModelContainer;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  void *v39;

  v5 = objc_msgSend_weightFormat(self, a2, v2, v3);
  if (v5 == 1)
  {
    objc_msgSend_modelContainerPath(self, v6, v7, v8);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v36, (uint64_t)v35, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)off_1EE41A9E8(v38, 8, 0);

    return v39;
  }
  else if (v5)
  {
    return 0;
  }
  else
  {
    objc_msgSend_networkInputs(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_network(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInputs_(v13, v14, (uint64_t)v9, v15);

    objc_msgSend_networkOutputs(self, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_network(self, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOutputs_(v23, v24, (uint64_t)v19, v25);

    objc_msgSend_network(self, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ModelContainer = (void *)objc_msgSend_generateModelContainer(v29, v30, v31, v32);

    return ModelContainer;
  }
}

- (id)modelContainerPath
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
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  size_t v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const void *ModelContainerWithJSON;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;

  objc_msgSend_networkInputs(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_network(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInputs_(v9, v10, (uint64_t)v5, v11);

  objc_msgSend_networkOutputs(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_network(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOutputs_(v19, v20, (uint64_t)v15, v21);

  NSTemporaryDirectory();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v22, v23, (uint64_t)CFSTR("model_generate.XXXXX"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_retainAutorelease(v25);
  v30 = (char *)objc_msgSend_UTF8String(v26, v27, v28, v29);
  v31 = mkdtemp(v30);
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = strlen(v31);
  objc_msgSend_stringWithFileSystemRepresentation_length_(v35, v37, (uint64_t)v31, v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_network(self, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_generateJSONAtPath_(v42, v43, (uint64_t)v38, v44);

  v47 = objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v45, (uint64_t)v38, v46);
  ModelContainerWithJSON = (const void *)MRLNeuralNetworkCreateModelContainerWithJSON(v47);
  objc_msgSend_stringByAppendingPathComponent_(v38, v49, (uint64_t)CFSTR("model_container.nlmodel"), v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v52, (uint64_t)v51, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  off_1EE41AA28(ModelContainerWithJSON, v54, 1, 0);

  if (ModelContainerWithJSON)
    CFRelease(ModelContainerWithJSON);

  return v51;
}

- (void)addInputs:(id)a3
{
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
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
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = a3;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v31;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend_inputs(self, v5, v6, v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v13, v14, v11, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend_unsignedIntegerValue(v16, v17, v18, v19);
        objc_msgSend_numberWithUnsignedInteger_(v12, v21, v20 + 1, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_inputs(self, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v27, v28, (uint64_t)v23, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v8);
  }

}

- (void)removeInput:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  id v24;

  v24 = a3;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_inputs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v24, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_unsignedIntegerValue(v11, v12, v13, v14);
  objc_msgSend_numberWithUnsignedInteger_(v4, v16, v15 - 1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputs(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v18, (uint64_t)v24);

}

- (void)addOutputs:(id)a3
{
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
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
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = a3;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v31;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend_outputs(self, v5, v6, v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v13, v14, v11, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend_unsignedIntegerValue(v16, v17, v18, v19);
        objc_msgSend_numberWithUnsignedInteger_(v12, v21, v20 + 1, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_outputs(self, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v27, v28, (uint64_t)v23, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v8);
  }

}

- (void)removeOutput:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  id v24;

  v24 = a3;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_outputs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v24, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_unsignedIntegerValue(v11, v12, v13, v14);
  objc_msgSend_numberWithUnsignedInteger_(v4, v16, v15 - 1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_outputs(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v18, (uint64_t)v24);

}

- (id)networkInputs
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
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend_inputs(self, v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v28;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v9);
        v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v16);
        objc_msgSend_inputs(self, v11, v12, v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v18, v19, v17, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend_unsignedIntegerValue(v21, v22, v23, v24) == 1;

        if (v25)
          objc_msgSend_addObject_(v5, v11, v17, v13);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v14);
  }

  return v5;
}

- (id)networkOutputs
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
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend_outputs(self, v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v28;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v9);
        v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v16);
        objc_msgSend_outputs(self, v11, v12, v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v18, v19, v17, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend_unsignedIntegerValue(v21, v22, v23, v24) == 1;

        if (v25)
          objc_msgSend_addObject_(v5, v11, v17, v13);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v14);
  }

  return v5;
}

- (unint64_t)weightFormat
{
  return self->_weightFormat;
}

- (MontrealNNModelNetwork)network
{
  return (MontrealNNModelNetwork *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)inputs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)outputs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_network, 0);
}

@end
