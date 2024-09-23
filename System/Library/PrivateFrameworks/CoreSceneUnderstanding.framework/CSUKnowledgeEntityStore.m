@implementation CSUKnowledgeEntityStore

- (CSUKnowledgeEntityStore)initWithDatabasePath:(id)a3 error:(id *)a4
{
  id v7;
  CSUKnowledgeEntityStore *v8;
  CSUKnowledgeEntityStore *v9;
  NSMutableDictionary *data;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSUKnowledgeEntityStore;
  v8 = -[CSUKnowledgeEntityStore init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_databasePath, a3);
    data = v9->_data;
    v9->_data = 0;

    if ((objc_msgSend_loadWithError_(v9, v11, (uint64_t)a4, v12, v13) & 1) == 0)
    {

      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)commitWithError:(id *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  void *v55;
  const char *v56;
  void *v57;
  id v58;
  const char *v59;
  BOOL v60;
  NSString *databasePath;
  id *v63;
  void *v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  _BYTE v77[128];
  uint64_t v78;

  v63 = a3;
  v78 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v9 = objc_msgSend_count(self->_data, v5, v6, v7, v8);
  v64 = (void *)objc_msgSend_initWithCapacity_(v4, v10, v9, v11, v12);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v13 = self->_data;
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v67, (uint64_t)v77, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v68 != v19)
          objc_enumerationMutation(v13);
        v21 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
        v75[0] = CFSTR("identifier");
        v75[1] = CFSTR("data");
        v76[0] = v21;
        objc_msgSend_objectForKeyedSubscript_(self->_data, v15, v21, v16, v17, v63);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_dictionary(v22, v23, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v76[1] = v27;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v28, (uint64_t)v76, (uint64_t)v75, 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v64, v30, (uint64_t)v29, v31, v32);

      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v67, (uint64_t)v77, 16);
    }
    while (v18);
  }

  v33 = (void *)MEMORY[0x24BDD1608];
  v73[0] = CFSTR("metadata");
  v71[0] = CFSTR("schemaVersion");
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v34, self->_schemaVersion, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v37;
  v71[1] = CFSTR("size");
  v38 = (void *)MEMORY[0x24BDD16E0];
  v43 = objc_msgSend_count(self->_data, v39, v40, v41, v42);
  objc_msgSend_numberWithUnsignedInteger_(v38, v44, v43, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v47;
  v71[2] = CFSTR("version");
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v48, self->_version, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v51;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v52, (uint64_t)v72, (uint64_t)v71, 3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = CFSTR("data");
  v74[0] = v53;
  v74[1] = v64;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v54, (uint64_t)v74, (uint64_t)v73, 2);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  objc_msgSend_dataWithJSONObject_options_error_(v33, v56, (uint64_t)v55, 0, (uint64_t)&v66);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v66;

  if (!v58)
  {
    databasePath = self->_databasePath;
    v65 = 0;
    objc_msgSend_writeToFile_options_error_(v57, v59, (uint64_t)databasePath, 0, (uint64_t)&v65);
    v58 = v65;
    if (!v58)
    {
      v60 = 1;
      goto LABEL_15;
    }
    if (v63)
      goto LABEL_10;
LABEL_13:
    v60 = 0;
    goto LABEL_15;
  }
  if (!v63)
    goto LABEL_13;
LABEL_10:
  v58 = objc_retainAutorelease(v58);
  v60 = 0;
  *v63 = v58;
LABEL_15:

  return v60;
}

- (BOOL)loadWithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  const char *v11;
  NSString *databasePath;
  const char *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  CSUKnowledgeEntityStore *v40;
  uint64_t v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSMutableDictionary *v51;
  NSMutableDictionary *data;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  CSUKnowledgeEntity *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  NSMutableDictionary *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  void *v78;
  void *v79;
  void *v80;
  BOOL v81;
  void *v82;
  id v83;
  id obj;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  id v90;
  id v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], a2, (uint64_t)a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_fileExistsAtPath_(v6, v7, (uint64_t)self->_databasePath, v8, v9);

  if ((v10 & 1) != 0)
  {
    databasePath = self->_databasePath;
    v91 = 0;
    objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x24BDBCE50], v11, (uint64_t)databasePath, 0, (uint64_t)&v91);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v91;
    if (v83)
    {
      if (a3)
      {
        v83 = objc_retainAutorelease(v83);
        v81 = 0;
        *a3 = v83;
      }
      else
      {
        v81 = 0;
      }
    }
    else
    {
      v90 = 0;
      objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v13, (uint64_t)v82, 0, (uint64_t)&v90);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v90;
      v81 = v20 == 0;
      v83 = v20;
      if (v20)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v20);
      }
      else
      {
        objc_msgSend_objectForKeyedSubscript_(v80, v21, (uint64_t)CFSTR("metadata"), v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v24, v25, (uint64_t)CFSTR("version"), v26, v27);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectForKeyedSubscript_(v80, v28, (uint64_t)CFSTR("metadata"), v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v31, v32, (uint64_t)CFSTR("schemaVersion"), v33, v34);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = (int)v78;
        if (v78)
          v39 = objc_msgSend_integerValue(v78, v35, v36, v37, v38);
        v40 = self;
        self->_version = v39;
        v41 = (uint64_t)v79;
        if (v79)
        {
          v41 = objc_msgSend_integerValue(v79, v35, v36, v37, v38);
          v40 = self;
        }
        v40->_schemaVersion = v41;
        v42 = objc_alloc(MEMORY[0x24BDBCED8]);
        v47 = objc_msgSend_count(v80, v43, v44, v45, v46);
        v51 = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v42, v48, v47, v49, v50);
        data = self->_data;
        self->_data = v51;

        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        objc_msgSend_objectForKeyedSubscript_(v80, v53, (uint64_t)CFSTR("data"), v54, v55);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v56, (uint64_t)&v86, (uint64_t)v92, 16);
        if (v57)
        {
          v58 = *(_QWORD *)v87;
          do
          {
            for (i = 0; i != v57; ++i)
            {
              if (*(_QWORD *)v87 != v58)
                objc_enumerationMutation(obj);
              v60 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
              v61 = [CSUKnowledgeEntity alloc];
              objc_msgSend_objectForKeyedSubscript_(v60, v62, (uint64_t)CFSTR("data"), v63, v64);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = (void *)objc_msgSend_initWithDictionary_(v61, v66, (uint64_t)v65, v67, v68);
              v70 = self->_data;
              objc_msgSend_objectForKeyedSubscript_(v60, v71, (uint64_t)CFSTR("identifier"), v72, v73);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v70, v75, (uint64_t)v69, (uint64_t)v74, v76);

            }
            v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v77, (uint64_t)&v86, (uint64_t)v92, 16);
          }
          while (v57);
        }

      }
    }

    return v81;
  }
  else
  {
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v15 = self->_data;
    self->_data = v14;

    self->_version = 0;
    self->_schemaVersion = 0;
    return objc_msgSend_commitWithError_(self, v16, (uint64_t)a3, v17, v18);
  }
}

- (unsigned)storeEntity:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
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
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableDictionary *data;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableDictionary *v35;
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

  v6 = a3;
  objc_msgSend_QID(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringFromIndex_(v11, v12, 1, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_integerValue(v15, v16, v17, v18, v19);

  if (!v20)
  {
    if (!a4)
    {
LABEL_7:
      LODWORD(v20) = 0;
      goto LABEL_8;
    }
    v40 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_QID(v6, v21, v22, v23, v24);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v40, v41, (uint64_t)CFSTR("Invalid QID: %@"), v42, v43, v36);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithCode_message_(CSUError, v45, 8, (uint64_t)v44, v46);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    goto LABEL_7;
  }
  data = self->_data;
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v21, v20, v23, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(data, v27, (uint64_t)v6, (uint64_t)v26, v28);

  if ((objc_msgSend_commitWithError_(self, v29, (uint64_t)a4, v30, v31) & 1) == 0)
  {
    v35 = self->_data;
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v32, v20, v33, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectForKey_(v35, v37, (uint64_t)v36, v38, v39);
    goto LABEL_6;
  }
LABEL_8:

  return v20;
}

- (id)entityForIdentifier:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  NSMutableDictionary *data;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  data = self->_data;
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], a2, *(uint64_t *)&a3, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(data, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)purgeDatabaseWithVersion:(int)a3 error:(id *)a4
{
  NSMutableDictionary *v7;
  NSMutableDictionary *data;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  data = self->_data;
  self->_data = v7;

  self->_version = a3;
  return objc_msgSend_commitWithError_(self, v9, (uint64_t)a4, v10, v11);
}

- (unint64_t)count
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend_count(self->_data, a2, v2, v3, v4);
}

- (void)enumerateIdentifiersUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, _BYTE *);
  NSMutableDictionary *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, _BYTE *))a3;
  v19 = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_data;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v15, (uint64_t)v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v16;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v12)
        objc_enumerationMutation(v5);
      v14 = objc_msgSend_integerValue(*(void **)(*((_QWORD *)&v15 + 1) + 8 * v13), v7, v8, v9, v10, (_QWORD)v15);
      v4[2](v4, v14, &v19);
      if (v19)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v15, (uint64_t)v20, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (int)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
}

@end
