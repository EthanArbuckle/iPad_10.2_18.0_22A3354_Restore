@implementation CSUSceneNetV5SceneTaxonomyAttributes

- (CSUSceneNetV5SceneTaxonomyAttributes)initWithAttributePaths:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CSUSceneNetV5SceneTaxonomyAttributes *v11;
  uint64_t v12;
  NSDictionary *attributePaths;
  NSMutableDictionary *v14;
  NSMutableDictionary *attributes;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSDictionary *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  CSUSceneNetV5SceneTaxonomyAttributes *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CSUSceneNetV5SceneTaxonomyAttributes;
  v11 = -[CSUSceneNetV5SceneTaxonomyAttributes init](&v46, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
    attributePaths = v11->_attributePaths;
    v11->_attributePaths = (NSDictionary *)v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    attributes = v11->_attributes;
    v11->_attributes = v14;

    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v21 = v11->_attributePaths;
    v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v42, (uint64_t)v47, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v43 != v27)
            objc_enumerationMutation(v21);
          v29 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v11->_attributePaths, v23, v29, v24, v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_fileExistsAtPath_(v20, v31, (uint64_t)v30, v32, v33) & 1) == 0)
          {
            if (a4)
            {
              objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v34, (uint64_t)CFSTR("Data file %@ for attribute %@ does not exist!"), v35, v36, v30, v29, (_QWORD)v42);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_errorWithCode_message_(CSUError, v39, 10, (uint64_t)v38, v40);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

            }
            v37 = 0;
            goto LABEL_14;
          }

        }
        v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v42, (uint64_t)v47, 16);
        if (v26)
          continue;
        break;
      }
    }

    v37 = v11;
LABEL_14:

  }
  else if (a4)
  {
    objc_msgSend_errorWithCode_message_(CSUError, v7, 4, (uint64_t)CFSTR("Failed to allocate memory for attribute manager"), v10);
    v37 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (id)attributeForKey:(id)a3 label:(id)a4 defaultValue:(id)a5
{
  id v8;
  id v9;
  id v10;
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
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_objectForKeyedSubscript_(self->_attributePaths, v11, (uint64_t)v8, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v15, (uint64_t)CFSTR("Invalid attribute key %@"), v16, v17, v8);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithCode_message_(CSUError, v53, 10, (uint64_t)v32, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_logInternalError_(CSUError, v56, (uint64_t)v55, v57, v58);

    goto LABEL_9;
  }
  objc_msgSend_objectForKeyedSubscript_(self->_attributes, v15, (uint64_t)v8, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v22 = (void *)MEMORY[0x24BDBCE70];
    v23 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend_objectForKeyedSubscript_(self->_attributePaths, v19, (uint64_t)v8, v20, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_(v23, v25, (uint64_t)v24, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0;
    objc_msgSend_dictionaryWithContentsOfURL_error_(v22, v29, (uint64_t)v28, (uint64_t)&v66, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v66;

    if (v31)
    {
      objc_msgSend_setObject_forKeyedSubscript_(self->_attributes, v33, (uint64_t)v31, (uint64_t)v8, v35);

      goto LABEL_5;
    }
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithCode_message_underlyingError_(CSUError, v61, 1, (uint64_t)v60, (uint64_t)v32);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_logInternalError_(CSUError, v63, (uint64_t)v62, v64, v65);

LABEL_9:
    v52 = 0;
    goto LABEL_10;
  }
LABEL_5:
  objc_msgSend_objectForKeyedSubscript_(self->_attributes, v19, (uint64_t)v8, v20, v21);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v36, v37, (uint64_t)v9, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = v40;
  if (!v40)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithCode_message_(CSUError, v46, 8, (uint64_t)v45, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_logInternalError_(CSUError, v49, (uint64_t)v48, v50, v51);

    v44 = v10;
  }
  v52 = v44;

LABEL_10:
  return v52;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_attributePaths, 0);
}

@end
