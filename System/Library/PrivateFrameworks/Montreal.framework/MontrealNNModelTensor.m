@implementation MontrealNNModelTensor

- (id)checkForValidity
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  _QWORD v13[2];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_name(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = CFSTR("name");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_checkForValidity_(self, v10, (uint64_t)v9, v11);

  return self;
}

- (MontrealNNModelTensor)initWithName:(id)a3 dimension:(id)a4
{
  id v7;
  id v8;
  MontrealNNModelTensor *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  MontrealNNModelTensor *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSHashTable *asInput;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSHashTable *asOutput;
  MontrealNNModelTensor *v24;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)MontrealNNModelTensor;
  v9 = -[MontrealNNModelTensor init](&v26, sel_init);
  v13 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v13->_dimension, a4);
    objc_msgSend_weakObjectsHashTable(MEMORY[0x1E0CB3690], v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    asInput = v13->_asInput;
    v13->_asInput = (NSHashTable *)v17;

    objc_msgSend_weakObjectsHashTable(MEMORY[0x1E0CB3690], v19, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    asOutput = v13->_asOutput;
    v13->_asOutput = (NSHashTable *)v22;

  }
  objc_msgSend_checkForValidity(v13, v10, v11, v12);
  v24 = (MontrealNNModelTensor *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (unint64_t)tensorSize
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend_dimension(self, a2, v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v6)
  {
    v10 = v6;
    v11 = *(_QWORD *)v16;
    v12 = 1;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v4);
        v12 *= objc_msgSend_unsignedIntegerValue(*(void **)(*((_QWORD *)&v15 + 1) + 8 * v13++), v7, v8, v9);
      }
      while (v10 != v13);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v15, (uint64_t)v19, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (MontrealNNModelTensor)initWithDictionary:(id)a3
{
  __CFString *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  MontrealNNModelTensor *v13;

  v4 = off_1EE418D98;
  v5 = a3;
  objc_msgSend_exMRL_stringForKey_(v5, v6, (uint64_t)v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exMRL_arrayForKey_(v5, v9, (uint64_t)off_1EE418DA0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (MontrealNNModelTensor *)objc_msgSend_initWithName_dimension_(self, v12, (uint64_t)v8, (uint64_t)v11);
  return v13;
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
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
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
  const char *v36;
  uint64_t v37;
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
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_name(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v12, (uint64_t)CFSTR("\r %@ Name = %@"), v13, v7, v11);

  objc_msgSend_dimension(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exMRL_numberArrayDescription(v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v22, (uint64_t)CFSTR("\r %@ Dimension = %@"), v23, v7, v21);

  objc_msgSend_appendFormat_(v6, v24, (uint64_t)CFSTR("\r %@ As Input"), v25, v7);
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  objc_msgSend_asInput(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v78, (uint64_t)v83, 16);
  if (v35)
  {
    v38 = v35;
    v39 = *(_QWORD *)v79;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v79 != v39)
          objc_enumerationMutation(v33);
        v41 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v40);
        objc_msgSend_indentByFactor_(v7, v36, 1, v37);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v41, v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendFormat_(v6, v47, (uint64_t)CFSTR("\r %@ %@"), v48, v42, v46);

        ++v40;
      }
      while (v38 != v40);
      v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v78, (uint64_t)v83, 16);
    }
    while (v38);
  }

  objc_msgSend_appendFormat_(v6, v49, (uint64_t)CFSTR("\r %@ As Output"), v50, v7);
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  objc_msgSend_asOutput(self, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v54, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v59, (uint64_t)&v74, (uint64_t)v82, 16);
  if (v60)
  {
    v63 = v60;
    v64 = *(_QWORD *)v75;
    do
    {
      v65 = 0;
      do
      {
        if (*(_QWORD *)v75 != v64)
          objc_enumerationMutation(v58);
        v66 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v65);
        objc_msgSend_indentByFactor_(v7, v61, 1, v62);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v66, v68, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendFormat_(v6, v72, (uint64_t)CFSTR("\r %@ %@"), v73, v67, v71);

        ++v65;
      }
      while (v63 != v65);
      v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v61, (uint64_t)&v74, (uint64_t)v82, 16);
    }
    while (v63);
  }

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

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v10, (uint64_t)v9, (uint64_t)off_1EE418D98);

  objc_msgSend_dimension(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v15, (uint64_t)v14, (uint64_t)off_1EE418DA0);

  v19 = (void *)objc_msgSend_copy(v5, v16, v17, v18);
  return v19;
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

+ (id)createInputs:(id *)a3 inputChunks:(id)a4 nodeName:(id)a5
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  MontrealNNModelTensor *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a5;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v6;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v33;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v18);
        v20 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v14, 1, v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v20, v22, (uint64_t)CFSTR("tensor_input_%@_%@"), v23, v7, v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = [MontrealNNModelTensor alloc];
        v27 = (void *)objc_msgSend_initWithName_dimension_(v25, v26, (uint64_t)v24, v19);
        objc_msgSend_addObject_(v11, v28, (uint64_t)v27, v29);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v32, (uint64_t)v36, 16);
    }
    while (v16);
  }

  return v11;
}

+ (id)createOutputs:(id *)a3 outputChunks:(id)a4 nodeName:(id)a5
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  MontrealNNModelTensor *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a5;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v6;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v33;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v18);
        v20 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v14, 1, v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v20, v22, (uint64_t)CFSTR("tensor_output_%@_%@"), v23, v7, v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = [MontrealNNModelTensor alloc];
        v27 = (void *)objc_msgSend_initWithName_dimension_(v25, v26, (uint64_t)v24, v19);
        objc_msgSend_addObject_(v11, v28, (uint64_t)v27, v29);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v32, (uint64_t)v36, 16);
    }
    while (v16);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
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
  const char *v14;
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
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_allocWithZone_(MontrealNNModelTensor, a2, (uint64_t)a3, v3);
  objc_msgSend_name(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dimension(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_initWithName_dimension_(v5, v14, (uint64_t)v9, (uint64_t)v13);

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend_asInput(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v61, (uint64_t)v66, 16);
  if (v25)
  {
    v29 = v25;
    v30 = *(_QWORD *)v62;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v62 != v30)
          objc_enumerationMutation(v23);
        v32 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v31);
        objc_msgSend_asInput(v15, v26, v27, v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v33, v34, v32, v35);

        ++v31;
      }
      while (v29 != v31);
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v61, (uint64_t)v66, 16);
    }
    while (v29);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend_asOutput(self, v36, v37, v38, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v57, (uint64_t)v65, 16);
  if (v45)
  {
    v49 = v45;
    v50 = *(_QWORD *)v58;
    do
    {
      v51 = 0;
      do
      {
        if (*(_QWORD *)v58 != v50)
          objc_enumerationMutation(v43);
        v52 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v51);
        objc_msgSend_asOutput(v15, v46, v47, v48);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v53, v54, v52, v55);

        ++v51;
      }
      while (v49 != v51);
      v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v57, (uint64_t)v65, 16);
    }
    while (v49);
  }

  return v15;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)dimension
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSHashTable)asInput
{
  return (NSHashTable *)objc_getProperty(self, a2, 24, 1);
}

- (NSHashTable)asOutput
{
  return (NSHashTable *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asOutput, 0);
  objc_storeStrong((id *)&self->_asInput, 0);
  objc_storeStrong((id *)&self->_dimension, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
