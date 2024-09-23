@implementation MontrealNNModelWeight

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
  void *v15;
  const char *v16;
  uint64_t v17;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend_name(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  v20[1] = CFSTR("name");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v20, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v7;
  objc_msgSend_index(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  v19[1] = CFSTR("index");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v14, (uint64_t)v21, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_checkForValidity_(self, v16, (uint64_t)v15, v17);

  return self;
}

- (MontrealNNModelWeight)initWithName:(id)a3 index:(id)a4 dimension:(id)a5
{
  id v9;
  id v10;
  id v11;
  MontrealNNModelWeight *v12;
  MontrealNNModelWeight *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MontrealNNModelWeight;
  v12 = -[MontrealNNModelWeight init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_index, a4);
    objc_storeStrong((id *)&v13->_dimension, a5);
  }

  return v13;
}

- (MontrealNNModelWeight)initWithName:(id)a3 index:(id)a4 dimension:(id)a5 weightData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  MontrealNNModelWeight *v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v15 = objc_msgSend_initWithName_index_dimension_(self, v14, (uint64_t)v10, (uint64_t)v11, v12);
  v19 = (void *)v15;
  if (v15)
    objc_storeStrong((id *)(v15 + 40), a6);
  objc_msgSend_checkForValidity(v19, v16, v17, v18);
  v20 = (MontrealNNModelWeight *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (MontrealNNModelWeight)initWithName:(id)a3 index:(id)a4 dimension:(id)a5 weightValues:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  MontrealNNModelWeight *v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v15 = objc_msgSend_initWithName_index_dimension_(self, v14, (uint64_t)v10, (uint64_t)v11, v12);
  v19 = (void *)v15;
  if (v15)
    objc_storeStrong((id *)(v15 + 32), a6);
  objc_msgSend_checkForValidity(v19, v16, v17, v18);
  v20 = (MontrealNNModelWeight *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (MontrealNNModelWeight)initWithDictionary:(id)a3 quantization:(id)a4 jsonDir:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  MontrealNNModelWeight *v14;
  uint64_t v15;
  NSString *name;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *dimension;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSNumber *index;
  MontrealNNModelWeight *v25;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)MontrealNNModelWeight;
  v14 = -[MontrealNNModelWeight init](&v27, sel_init);
  if (v14)
  {
    objc_msgSend_exMRL_stringForKey_(v8, v11, (uint64_t)off_1EE418B20, v13);
    v15 = objc_claimAutoreleasedReturnValue();
    name = v14->_name;
    v14->_name = (NSString *)v15;

    objc_msgSend_exMRL_arrayForKey_(v8, v17, (uint64_t)off_1EE418B18, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    dimension = v14->_dimension;
    v14->_dimension = (NSArray *)v19;

    objc_msgSend_exMRL_numberForKey_(v8, v21, (uint64_t)off_1EE418B10, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    index = v14->_index;
    v14->_index = (NSNumber *)v23;

    objc_storeStrong((id *)&v14->_quantization, a4);
    objc_storeStrong((id *)&v14->_jsonDir, a5);
  }
  objc_msgSend_checkForValidity(v14, v11, v12, v13);
  v25 = (MontrealNNModelWeight *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
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
  id v29;

  v29 = a3;
  v6 = a4;
  objc_msgSend_name(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v29, v11, (uint64_t)CFSTR("\r %@ Name = %@ "), v12, v6, v10);

  objc_msgSend_index(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v29, v17, (uint64_t)CFSTR("\r %@ Index = %@ "), v18, v6, v16);

  objc_msgSend_dimension(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exMRL_numberArrayDescription(v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v29, v27, (uint64_t)CFSTR("\r %@ Dimension = %@ "), v28, v6, v26);

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

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v10, (uint64_t)v9, (uint64_t)off_1EE418B20);

  objc_msgSend_dimension(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v15, (uint64_t)v14, (uint64_t)off_1EE418DA0);

  objc_msgSend_index(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v5, v20, (uint64_t)v19, (uint64_t)off_1EE418B10);

  v24 = (void *)objc_msgSend_copy(v5, v21, v22, v23);
  return v24;
}

- (void)generateJSONAtPath:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  id v67;

  v67 = a3;
  objc_msgSend_jsonDir(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v11 = (void *)MEMORY[0x1E0C99E98];
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_jsonDir(self, v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_index(self, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v12, v18, (uint64_t)CFSTR("%@/%@.json"), v19, v13, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_(v11, v21, (uint64_t)v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1E0C99E98];
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_index(self, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v25, v30, (uint64_t)CFSTR("%@/%@.json"), v31, v67, v29);
    v32 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_(v24, v33, v32, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v32) = objc_msgSend_copyItemAtURL_toURL_error_(v39, v40, (uint64_t)v23, (uint64_t)v35, 0);

    if ((v32 & 1) == 0)
      sub_19C09C77C(CFSTR("%@ Source file %@ doesn't exist"), v41, v42, v43, v44, v45, v46, v47, (uint64_t)self);
  }
  else
  {
    objc_msgSend_weightValues(self, v8, v9, v10);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v48)
      sub_19C09C77C(CFSTR("%@ Cannot generate JSON weights file"), (uint64_t)v49, v50, v51, v52, v53, v54, v55, (uint64_t)self);
    v56 = (void *)MEMORY[0x1E0CB36D8];
    objc_msgSend_weightValues(self, v49, v50, v51);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithJSONObject_options_error_(v56, v58, (uint64_t)v57, 1, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_index(self, v60, v61, v62);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v59, v63, (uint64_t)CFSTR("%@/%@.json"), v64, v67, v35);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writeToFile_atomically_(v23, v66, (uint64_t)v65, 1);

  }
}

- (id)createDataContainer
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
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
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_jsonDir(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_index(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v15, (uint64_t)CFSTR("%@/%@.json"), v16, v10, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend_fileExistsAtPath_(v21, v22, (uint64_t)v17, v23);

  if ((_DWORD)v14)
  {
    objc_msgSend_createflattenWeightsFile_(self, v24, (uint64_t)v17, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_quantization(self, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_createConvertArrayToData_quantization_(self, v32, (uint64_t)v27, (uint64_t)v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_index(self, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v5, v38, (uint64_t)v33, (uint64_t)v37);

  }
  else
  {
    objc_msgSend_weightData(self, v24, v25, v26);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v39)
      sub_19C09C77C(CFSTR("%@ No weights file or data to add to data container"), (uint64_t)v40, v41, v42, v43, v44, v45, v46, (uint64_t)self);
    objc_msgSend_weightData(self, v40, v41, v42);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_index(self, v47, v48, v49);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v5, v50, (uint64_t)v27, (uint64_t)v33);
  }

  v54 = (void *)objc_msgSend_copy(v5, v51, v52, v53);
  return v54;
}

- (id)createflattenWeightsFile:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E0C99D50], a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v6, (uint64_t)v5, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createflattenWeightsHierarchy_(self, v8, (uint64_t)v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createflattenWeightsHierarchy:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v4;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_addObjectsFromArray_(v8, v15, (uint64_t)v9, v16, (_QWORD)v26);
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_createflattenWeightsHierarchy_(self, v17, v14, v18, (_QWORD)v26);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v8, v20, (uint64_t)v19, v21);

        }
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v17, (uint64_t)&v26, (uint64_t)v30, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_13:

  objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99D20], v22, (uint64_t)v8, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)createConvertArrayToData:(id)a3 quantization:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  std::ios_base *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  id v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  char *v28;
  int v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  size_t v47;
  _BYTE *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  size_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  size_t v56;
  vImagePixelCount v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  float v61;
  float v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  void *v72;
  void *v73;
  uint64_t *v75;
  uint64_t v76;
  id v77;
  void *v78;
  char v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  char *v87;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91[8];
  __int128 __p;
  __int128 v93;
  int v94;
  uint64_t v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v77 = a3;
  v5 = a4;
  v75 = &v95;
  v6 = MEMORY[0x1E0DE4FE0];
  v7 = MEMORY[0x1E0DE4FE0] + 64;
  v8 = (uint64_t *)MEMORY[0x1E0DE4F60];
  v9 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
  v10 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
  v95 = MEMORY[0x1E0DE4FE0] + 64;
  v90 = v9;
  *(uint64_t *)((char *)&v91[-1] + *(_QWORD *)(v9 - 24)) = v10;
  v11 = (std::ios_base *)((char *)&v91[-1] + *(_QWORD *)(v90 - 24));
  std::ios_base::init(v11, v91);
  v11[1].__vftable = 0;
  v11[1].__fmtflags_ = -1;
  v90 = v6 + 24;
  v95 = v7;
  std::streambuf::basic_streambuf();
  v91[0] = MEMORY[0x1E0DE4FB8] + 16;
  __p = 0u;
  v93 = 0u;
  v94 = 20;
  v15 = objc_msgSend_count(v77, v12, v13, v14);
  v16 = v15;
  v87 = 0;
  v88 = 0;
  v89 = 0;
  if (v15)
  {
    if (v15 >> 62)
      sub_19C07DA0C();
    v17 = (char *)operator new(4 * v15);
    v87 = v17;
    v89 = &v17[4 * v16];
    bzero(v17, 4 * v16);
    v88 = v89;
  }
  else
  {
    v17 = 0;
  }
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v18 = v77;
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v83, (uint64_t)v96, 16);
  if (v23)
  {
    v24 = 0;
    v25 = *(_QWORD *)v84;
    do
    {
      v26 = 0;
      v27 = v24;
      v28 = &v17[4 * v24];
      do
      {
        if (*(_QWORD *)v84 != v25)
          objc_enumerationMutation(v18);
        objc_msgSend_floatValue(*(void **)(*((_QWORD *)&v83 + 1) + 8 * v26), v20, v21, v22, v75);
        *(_DWORD *)&v28[4 * v26++] = v29;
      }
      while (v23 != v26);
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v20, (uint64_t)&v83, (uint64_t)v96, 16);
      v24 = v27 + v26;
    }
    while (v23);
  }

  objc_msgSend_weightStorage(v5, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_weightStorageRange(v5, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v33, v38, (uint64_t)off_1EE418D38, v39))
  {
    v43 = objc_msgSend_count(v18, v40, v41, v42);
    v80 = 0;
    v81 = 0;
    v82 = 0;
    if (v43)
    {
      if (v43 < 0)
        sub_19C07DA0C();
      v47 = 2 * v43;
      v48 = operator new(2 * v43);
      bzero(v48, v47);
    }
    else
    {
      v48 = 0;
    }
    v57 = objc_msgSend_count(v18, v44, v45, v46, v75);
    sub_19C22CA4C(v17, v48, v57);
    objc_msgSend_count(v18, v58, v59, v60);
    std::ostream::write();
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(v33, v40, (uint64_t)off_1EE418D40, v42))
    {
      objc_msgSend_count(v18, v49, v50, v51);
      std::ostream::write();
      goto LABEL_27;
    }
    v52 = objc_msgSend_count(v18, v49, v50, v51);
    v56 = v52;
    v80 = 0;
    v81 = 0;
    v82 = 0;
    if (v52)
    {
      if ((v52 & 0x8000000000000000) != 0)
        sub_19C07DA0C();
      v48 = operator new(v52);
      bzero(v48, v56);
    }
    else
    {
      v48 = 0;
    }
    objc_msgSend_floatValue(v37, v53, v54, v55, v75);
    v62 = v61;
    v66 = objc_msgSend_count(v18, v63, v64, v65);
    sub_19C22CAD4((float *)v17, v48, v66, v62);
    objc_msgSend_count(v18, v67, v68, v69);
    std::ostream::write();
  }
  if (v48)
    operator delete(v48);
LABEL_27:
  std::stringbuf::str();
  v70 = (void *)MEMORY[0x1E0C99D50];
  std::stringbuf::str();
  if (v79 >= 0)
    v72 = &v78;
  else
    v72 = v78;
  if (v82 >= 0)
    objc_msgSend_dataWithBytes_length_(v70, v71, (uint64_t)v72, HIBYTE(v82), v75);
  else
    objc_msgSend_dataWithBytes_length_(v70, v71, (uint64_t)v72, v81, v75);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79 < 0)
  {
    operator delete(v78);
    if ((SHIBYTE(v82) & 0x80000000) == 0)
      goto LABEL_35;
  }
  else if ((SHIBYTE(v82) & 0x80000000) == 0)
  {
    goto LABEL_35;
  }
  operator delete(v80);
LABEL_35:

  if (v17)
    operator delete(v17);
  v90 = *v8;
  *(uint64_t *)((char *)&v91[-1] + *(_QWORD *)(v90 - 24)) = v8[3];
  v91[0] = MEMORY[0x1E0DE4FB8] + 16;
  if (SBYTE7(v93) < 0)
    operator delete((void *)__p);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1A1AD1C08](v76);

  return v73;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)index
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)dimension
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)weightValues
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)weightData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (MontrealNNModelQuantization)quantization
{
  return (MontrealNNModelQuantization *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)jsonDir
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonDir, 0);
  objc_storeStrong((id *)&self->_quantization, 0);
  objc_storeStrong((id *)&self->_weightData, 0);
  objc_storeStrong((id *)&self->_weightValues, 0);
  objc_storeStrong((id *)&self->_dimension, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
