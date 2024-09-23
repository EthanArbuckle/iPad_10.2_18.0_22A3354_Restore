@implementation CSUSearchableKnowledgeObject

- (CSUSearchableKnowledgeObject)initWithQID:(unint64_t)a3 idType:(signed __int16)a4 localizedLabel:(id)a5 confidence:(double)a6 sensitiveLocation:(BOOL)a7 category:(id)a8 vertical:(id)a9 localizedSynonyms:(id)a10 longitude:(double)a11 latitute:(double)a12 version:(int)a13
{
  _BOOL8 v17;
  uint64_t v19;
  id v22;
  id v23;
  id v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  CSUSearchableKnowledgeObject *v35;
  id v38;
  void *v39;
  id v40;
  void *v41;
  _QWORD v42[2];

  v17 = a7;
  v19 = a4;
  v42[1] = *MEMORY[0x24BDAC8D0];
  v38 = a5;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = objc_alloc(MEMORY[0x24BDBCEA0]);
  v29 = (void *)objc_msgSend_initWithLocaleIdentifier_(v25, v26, (uint64_t)CFSTR("en_US"), v27, v28);
  v41 = v29;
  v42[0] = v38;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v30, (uint64_t)v42, (uint64_t)&v41, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v29;
  v40 = v24;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v32, (uint64_t)&v40, (uint64_t)&v39, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (CSUSearchableKnowledgeObject *)objc_msgSend_initWithQID_idType_localizedLabelDictionary_confidence_sensitiveLocation_category_vertical_localizedSynonymsDictionary_longitude_latitude_version_(self, v34, a3, v19, (uint64_t)v31, v17, v22, v23, a6, a11, a12, v33, a13);

  return v35;
}

- (CSUSearchableKnowledgeObject)initWithQID:(unint64_t)a3 idType:(signed __int16)a4 localizedLabel:(id)a5 confidence:(double)a6 sensitiveLation:(BOOL)a7 category:(id)a8 vertical:(id)a9 localizedSynonyms:(id)a10 longitude:(double)a11 latitute:(double)a12 version:(int)a13 locale:(id)a14
{
  _BOOL8 v18;
  uint64_t v20;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  CSUSearchableKnowledgeObject *v33;
  void *v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[2];

  v18 = a7;
  v20 = a4;
  v40[1] = *MEMORY[0x24BDAC8D0];
  v23 = a5;
  v24 = a8;
  v25 = a9;
  v26 = a10;
  v27 = a14;
  v39 = v27;
  v40[0] = v23;
  v36 = v23;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v28, (uint64_t)v40, (uint64_t)&v39, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v27;
  v38 = v26;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v30, (uint64_t)&v38, (uint64_t)&v37, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (CSUSearchableKnowledgeObject *)objc_msgSend_initWithQID_idType_localizedLabelDictionary_confidence_sensitiveLocation_category_vertical_localizedSynonymsDictionary_longitude_latitude_version_(self, v32, a3, v20, (uint64_t)v29, v18, v24, v25, a6, a11, a12, v31, a13);

  return v33;
}

- (CSUSearchableKnowledgeObject)initWithQID:(unint64_t)a3 idType:(signed __int16)a4 localizedLabelDictionary:(id)a5 confidence:(double)a6 sensitiveLocation:(BOOL)a7 category:(id)a8 vertical:(id)a9 localizedSynonymsDictionary:(id)a10 longitude:(double)a11 latitude:(double)a12 version:(int)a13
{
  id v22;
  id v23;
  id v24;
  CSUSearchableKnowledgeObject *v25;
  CSUSearchableKnowledgeObject *v26;
  NSString *localizedLabel;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableDictionary *localizedLabelDictionary;
  NSMutableDictionary *localizedSynonyms;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSMutableDictionary *localizedSynonymsDictionary;
  CSUSearchableKnowledgeObject *v41;
  id v43;
  objc_super v44;

  v22 = a5;
  v43 = a8;
  v23 = a9;
  v24 = a10;
  v44.receiver = self;
  v44.super_class = (Class)CSUSearchableKnowledgeObject;
  v25 = -[CSUSearchableKnowledgeObject init](&v44, sel_init);
  v26 = v25;
  if (v25)
  {
    v25->_idType = a4;
    localizedLabel = v25->_localizedLabel;
    v25->_qid = a3;
    v25->_localizedLabel = 0;

    v32 = objc_msgSend_copy(v22, v28, v29, v30, v31);
    localizedLabelDictionary = v26->_localizedLabelDictionary;
    v26->_localizedLabelDictionary = (NSMutableDictionary *)v32;

    v26->_confidenceValue = a6;
    v26->_sensitiveLocation = a7;
    objc_storeStrong((id *)&v26->_category, a8);
    objc_storeStrong((id *)&v26->_vertical, a9);
    localizedSynonyms = v26->_localizedSynonyms;
    v26->_localizedSynonyms = 0;

    v39 = objc_msgSend_copy(v24, v35, v36, v37, v38);
    localizedSynonymsDictionary = v26->_localizedSynonymsDictionary;
    v26->_localizedSynonymsDictionary = (NSMutableDictionary *)v39;

    v26->_longitude = a11;
    v26->_latitude = a12;
    v26->_version = a13;
    v41 = v26;
  }

  return v26;
}

+ (BOOL)labelDictionaryFromString:(id)a3 directoryWriteBack:(id *)a4 error:(id *)a5
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  BOOL v42;
  void *v43;
  void *v44;
  id *v46;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v48 = a3;
  if (a4)
  {
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = a4;
    objc_msgSend_componentsSeparatedByString_(v48, v11, (uint64_t)CFSTR(";"), v12, v13);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v49, (uint64_t)v53, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v50;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v50 != v20)
            objc_enumerationMutation(v14);
          objc_msgSend_componentsSeparatedByString_(*(void **)(*((_QWORD *)&v49 + 1) + 8 * i), v16, (uint64_t)CFSTR(":"), v17, v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(v22, v23, v24, v25, v26) != 2)
          {
            objc_msgSend_errorForDictionaryDeserialization_(CSUError, v27, (uint64_t)CFSTR("Corrupted dictionary"), v28, v29);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v43;
            if (a5)
              *a5 = objc_retainAutorelease(v43);

            v42 = 0;
            goto LABEL_14;
          }
          v30 = (void *)MEMORY[0x24BDBCEA0];
          objc_msgSend_objectAtIndexedSubscript_(v22, v27, 0, v28, v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_localeWithLocaleIdentifier_(v30, v32, (uint64_t)v31, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_objectAtIndexedSubscript_(v22, v36, 1, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v10, v40, (uint64_t)v39, (uint64_t)v35, v41);

        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v49, (uint64_t)v53, 16);
        if (v19)
          continue;
        break;
      }
    }

    *v46 = objc_retainAutorelease(v10);
    v42 = 1;
LABEL_14:

  }
  else
  {
    v42 = 0;
  }

  return v42;
}

+ (id)stringFromLabelDictionary:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
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
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = v35;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v36, (uint64_t)v40, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v37 != v15)
          objc_enumerationMutation(v8);
        v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend_localeIdentifier(v17, v10, v11, v12, v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v8, v19, (uint64_t)v17, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v23, (uint64_t)CFSTR("%@%@%@"), v24, v25, v18, CFSTR(":"), v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v7, v27, (uint64_t)v26, v28, v29);

      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v36, (uint64_t)v40, 16);
    }
    while (v14);
  }

  objc_msgSend_componentsJoinedByString_(v7, v30, (uint64_t)CFSTR(";"), v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

+ (BOOL)synonymsDictionaryFromLocaleString:(id)a3 directoryWriteBack:(id *)a4 error:(id *)a5
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  id *v52;
  id *v54;
  id v56;
  id obj;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v56 = a3;
  v54 = a4;
  if (a4)
  {
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v6, v7, v8, v9);
    v58 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsSeparatedByString_(v56, v10, (uint64_t)CFSTR(";"), v11, v12);
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v59, (uint64_t)v63, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v60;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v60 != v18)
            objc_enumerationMutation(obj);
          objc_msgSend_componentsSeparatedByString_(*(void **)(*((_QWORD *)&v59 + 1) + 8 * i), v14, (uint64_t)CFSTR(":"), v15, v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(v20, v21, v22, v23, v24) != 2)
          {
            objc_msgSend_errorForDictionaryDeserialization_(CSUError, v25, (uint64_t)CFSTR("Corrupted dictionary"), v26, v27);
            v52 = (id *)objc_claimAutoreleasedReturnValue();
            a4 = v52;
            if (a5)
              *a5 = objc_retainAutorelease(v52);

            LOBYTE(a4) = 0;
            goto LABEL_14;
          }
          v28 = objc_alloc(MEMORY[0x24BDBCEA0]);
          objc_msgSend_objectAtIndexedSubscript_(v20, v29, 0, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)objc_msgSend_initWithLocaleIdentifier_(v28, v33, (uint64_t)v32, v34, v35);

          v37 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend_objectAtIndexedSubscript_(v20, v38, 1, v39, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_componentsSeparatedByString_(v41, v42, (uint64_t)CFSTR(", "), v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithArray_(v37, v46, (uint64_t)v45, v47, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_setObject_forKeyedSubscript_(v58, v50, (uint64_t)v49, (uint64_t)v36, v51);
        }
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v59, (uint64_t)v63, 16);
        if (v17)
          continue;
        break;
      }
    }

    *v54 = objc_retainAutorelease(v58);
    LOBYTE(a4) = 1;
LABEL_14:

  }
  return (char)a4;
}

+ (id)stringFromSynonymsDictionary:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
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
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id obj;
  id v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v47 = a3;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v3, v4, v5, v6);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v47, v7, v8, v9, v10);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v49, (uint64_t)v53, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v50 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend_localeIdentifier(v19, v12, v13, v14, v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v47, v21, (uint64_t)v19, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allObjects(v24, v25, v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_componentsJoinedByString_(v29, v30, (uint64_t)CFSTR(", "), v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v34, (uint64_t)CFSTR("%@%@%@"), v35, v36, v20, CFSTR(":"), v33);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v48, v38, (uint64_t)v37, v39, v40);

      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v49, (uint64_t)v53, 16);
    }
    while (v16);
  }

  objc_msgSend_componentsJoinedByString_(v48, v41, (uint64_t)CFSTR(";"), v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

+ (id)searchDictionary:(id)a3 withLocale:(id)a4
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
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  int isEqualToString;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  _BOOL4 v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t k;
  void *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  id v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  id v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  id v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  id obj;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v111 = v5;
  v112 = v6;
  objc_msgSend_objectForKeyedSubscript_(v5, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  if (v10)
  {
    v15 = v10;
  }
  else
  {
    v16 = *MEMORY[0x24BDBCB20];
    objc_msgSend_objectForKey_(v6, v11, *MEMORY[0x24BDBCB20], v12, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BDBCAE8];
    objc_msgSend_objectForKey_(v6, v19, *MEMORY[0x24BDBCAE8], v20, v21);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    obj = v5;
    v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v123, (uint64_t)v129, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v124;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v124 != v27)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * i);
          objc_msgSend_objectForKey_(v29, v23, v16, v24, v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isEqualToString_(v30, v31, (uint64_t)v17, v32, v33) & 1) != 0)
          {
            objc_msgSend_objectForKey_(v29, v34, v18, v35, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v37, v38, (uint64_t)v113, v39, v40);

            if (isEqualToString)
            {
              objc_msgSend_objectForKeyedSubscript_(obj, v23, (uint64_t)v29, v24, v25);
              v92 = objc_claimAutoreleasedReturnValue();
LABEL_35:
              v15 = (id)v92;

              goto LABEL_36;
            }
          }
          else
          {

          }
        }
        v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v123, (uint64_t)v129, 16);
        if (v26)
          continue;
        break;
      }
    }

    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    obj = obj;
    v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v42, (uint64_t)&v119, (uint64_t)v128, 16);
    if (v46)
    {
      v47 = *(_QWORD *)v120;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v120 != v47)
            objc_enumerationMutation(obj);
          v49 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * j);
          objc_msgSend_objectForKey_(v49, v43, v16, v44, v45);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isEqualToString_(v50, v51, (uint64_t)v17, v52, v53) & 1) != 0)
          {
            objc_msgSend_objectForKey_(v49, v54, v18, v55, v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v57 == 0;

            if (v58)
            {
              objc_msgSend_objectForKeyedSubscript_(obj, v43, (uint64_t)v49, v44, v45);
              v92 = objc_claimAutoreleasedReturnValue();
              goto LABEL_35;
            }
          }
          else
          {

          }
        }
        v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v119, (uint64_t)v128, 16);
      }
      while (v46);
    }

    objc_msgSend_allKeys(obj, v59, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingComparator_(v63, v64, (uint64_t)&unk_250B0DF40, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    v68 = v67;
    v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v69, (uint64_t)&v115, (uint64_t)v127, 16);
    if (v73)
    {
      v74 = *(_QWORD *)v116;
      while (2)
      {
        for (k = 0; k != v73; ++k)
        {
          if (*(_QWORD *)v116 != v74)
            objc_enumerationMutation(v68);
          v76 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * k);
          objc_msgSend_objectForKey_(v76, v70, v16, v71, v72);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend_isEqualToString_(v77, v78, (uint64_t)v17, v79, v80);

          if (v81)
          {
            objc_msgSend_objectForKeyedSubscript_(obj, v70, (uint64_t)v76, v71, v72);
            v15 = (id)objc_claimAutoreleasedReturnValue();
            v86 = v68;
            goto LABEL_44;
          }
        }
        v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v70, (uint64_t)&v115, (uint64_t)v127, 16);
        if (v73)
          continue;
        break;
      }
    }

    v82 = objc_alloc(MEMORY[0x24BDBCEA0]);
    v86 = (void *)objc_msgSend_initWithLocaleIdentifier_(v82, v83, (uint64_t)CFSTR("en"), v84, v85);
    objc_msgSend_objectForKeyedSubscript_(obj, v87, (uint64_t)v86, v88, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v90;
    if (v90)
    {
      v15 = v90;
    }
    else
    {
      v94 = objc_alloc(MEMORY[0x24BDBCEA0]);
      v98 = (void *)objc_msgSend_initWithLocaleIdentifier_(v94, v95, (uint64_t)CFSTR("en_US"), v96, v97);
      objc_msgSend_objectForKeyedSubscript_(obj, v99, (uint64_t)v98, v100, v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      if (v102)
      {
        v103 = v98;
      }
      else
      {
        v104 = objc_alloc(MEMORY[0x24BDBCEA0]);
        v103 = (void *)objc_msgSend_initWithLocaleIdentifier_(v104, v105, (uint64_t)CFSTR("en-US"), v106, v107);

        objc_msgSend_objectForKeyedSubscript_(obj, v108, (uint64_t)v103, v109, v110);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = v102;

    }
LABEL_44:

LABEL_36:
    v14 = 0;
  }

  return v15;
}

- (id)localizedLabelWithLocale:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  objc_msgSend_localizedLabelDictionary(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_searchDictionary_withLocale_(CSUSearchableKnowledgeObject, v10, (uint64_t)v9, (uint64_t)v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)localizedSynonymsWithLocale:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  objc_msgSend_localizedSynonymsDictionary(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_searchDictionary_withLocale_(CSUSearchableKnowledgeObject, v10, (uint64_t)v9, (uint64_t)v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setLocalizedLabel:(id)a3 forLocale:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend_localizedLabelDictionary(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v11, v12, (uint64_t)v14, (uint64_t)v6, v13);

}

- (void)setLocalizedSynonyms:(id)a3 forLocale:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend_localizedSynonymsDictionary(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v11, v12, (uint64_t)v14, (uint64_t)v6, v13);

}

- (unint64_t)qid
{
  return self->_qid;
}

- (signed)idType
{
  return self->_idType;
}

- (NSString)localizedLabel
{
  return self->_localizedLabel;
}

- (NSMutableDictionary)localizedLabelDictionary
{
  return self->_localizedLabelDictionary;
}

- (double)confidenceValue
{
  return self->_confidenceValue;
}

- (BOOL)sensitiveLocation
{
  return self->_sensitiveLocation;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)vertical
{
  return self->_vertical;
}

- (NSMutableDictionary)localizedSynonyms
{
  return self->_localizedSynonyms;
}

- (NSMutableDictionary)localizedSynonymsDictionary
{
  return self->_localizedSynonymsDictionary;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (int)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSynonymsDictionary, 0);
  objc_storeStrong((id *)&self->_localizedSynonyms, 0);
  objc_storeStrong((id *)&self->_vertical, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_localizedLabelDictionary, 0);
  objc_storeStrong((id *)&self->_localizedLabel, 0);
}

@end
