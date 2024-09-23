@implementation CKOrderedDictionary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->tuples, 0);
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->tuples;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v7)
  {
    v11 = v7;
    v12 = *(_QWORD *)v22;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v12)
        objc_enumerationMutation(v5);
      v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
      v20 = 0;
      objc_msgSend_v1(v14, v8, v9, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_v2(v14, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v15, v19, &v20);

      if (v20)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v21, (uint64_t)v25, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)addObject:(id)a3 forKey:(id)a4
{
  NSMutableArray *tuples;
  id v6;
  id v7;
  CKTuple2 *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  id v12;

  tuples = self->tuples;
  v6 = a4;
  v7 = a3;
  v8 = [CKTuple2 alloc];
  v12 = (id)objc_msgSend_initWithObject1_object2_(v8, v9, (uint64_t)v6, (uint64_t)v7);

  objc_msgSend_addObject_(tuples, v10, (uint64_t)v12, v11);
}

- (unint64_t)count
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_count(self->tuples, a2, v2, v3);
}

+ (id)orderedDictionary
{
  return objc_alloc_init(CKOrderedDictionary);
}

- (CKOrderedDictionary)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  CKOrderedDictionary *v5;
  uint64_t v6;
  NSMutableArray *tuples;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKOrderedDictionary;
  v5 = -[CKOrderedDictionary init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v2, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    tuples = v5->tuples;
    v5->tuples = (NSMutableArray *)v6;

  }
  return v5;
}

+ (CKOrderedDictionary)orderedDictionaryWithCapacity:(unint64_t)a3
{
  CKOrderedDictionary *v4;
  const char *v5;
  uint64_t v6;

  v4 = [CKOrderedDictionary alloc];
  return (CKOrderedDictionary *)(id)objc_msgSend_initWithCapacity_(v4, v5, a3, v6);
}

- (CKOrderedDictionary)initWithCapacity:(unint64_t)a3
{
  const char *v4;
  uint64_t v5;
  CKOrderedDictionary *v6;
  uint64_t v7;
  NSMutableArray *tuples;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKOrderedDictionary;
  v6 = -[CKOrderedDictionary init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v4, a3, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    tuples = v6->tuples;
    v6->tuples = (NSMutableArray *)v7;

  }
  return v6;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend_stringWithString_(MEMORY[0x1E0CB37A0], a2, (uint64_t)CFSTR("(\n"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = self->tuples;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v7)
  {
    v11 = v7;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend_v1(v14, v8, v9, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_v2(v14, v16, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendFormat_(v4, v20, (uint64_t)CFSTR("%@=%@;\n"), v21, v15, v19, (_QWORD)v25);

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v11);
  }

  objc_msgSend_appendString_(v4, v22, (uint64_t)CFSTR(")"), v23);
  return v4;
}

- (id)dictionaryRepresentationRecursive:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  char v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  char v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v88;
  void *v89;
  _BOOL4 v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  NSMutableArray *obj;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v4 = a3;
  v105 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = objc_msgSend_count(self->tuples, a2, a3, v3);
  objc_msgSend_dictionaryWithCapacity_(v6, v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = self->tuples;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v99, (uint64_t)v104, 16);
  if (v12)
  {
    v16 = v12;
    v17 = *(_QWORD *)v100;
    v90 = v4;
    v88 = *(_QWORD *)v100;
    v89 = v10;
    do
    {
      v18 = 0;
      v91 = v16;
      do
      {
        if (*(_QWORD *)v100 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v18);
        if (!v4)
          goto LABEL_39;
        objc_msgSend_v2(*(void **)(*((_QWORD *)&v99 + 1) + 8 * v18), v13, v14, v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        objc_msgSend_v2(v19, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v25;
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend_unorderedDictionary(v25, v26, v27, v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_v1(v19, v31, v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v10, v35, (uint64_t)v30, (uint64_t)v34);

          goto LABEL_40;
        }
        objc_opt_class();
        v36 = objc_opt_isKindOfClass();

        objc_msgSend_v2(v19, v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v40;
        if ((v36 & 1) != 0)
        {
          if (objc_msgSend_count(v40, v41, v42, v43))
          {
            v92 = v19;
            v93 = v18;
            v30 = 0;
            v46 = 0;
            do
            {
              objc_msgSend_objectAtIndexedSubscript_(v29, v44, v46, v45);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (!v30)
                  v30 = (void *)objc_msgSend_mutableCopy(v29, v48, v49, v50);
                objc_msgSend_dictionaryRepresentationRecursive_(v47, v48, 1, v50);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_atIndexedSubscript_(v30, v52, (uint64_t)v51, v46);

              }
              ++v46;
            }
            while (v46 < objc_msgSend_count(v29, v53, v54, v55));
            if (v30)
            {
              objc_msgSend_v1(v19, v44, v56, v45);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v10, v58, (uint64_t)v30, (uint64_t)v57);

LABEL_33:
              v16 = v91;
              v18 = v93;
              goto LABEL_40;
            }
            goto LABEL_36;
          }
          goto LABEL_38;
        }
        objc_opt_class();
        v59 = objc_opt_isKindOfClass();

        if ((v59 & 1) != 0)
        {
          v93 = v18;
          objc_msgSend_v2(v19, v13, v14, v15);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = 0u;
          v96 = 0u;
          v97 = 0u;
          v98 = 0u;
          objc_msgSend_allKeys(v29, v60, v61, v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v95, (uint64_t)v103, 16);
          if (v65)
          {
            v68 = v65;
            v92 = v19;
            v30 = 0;
            v69 = *(_QWORD *)v96;
            do
            {
              for (i = 0; i != v68; ++i)
              {
                if (*(_QWORD *)v96 != v69)
                  objc_enumerationMutation(v63);
                v71 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i);
                objc_msgSend_objectForKeyedSubscript_(v29, v66, v71, v67);
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  if (!v30)
                    v30 = (void *)objc_msgSend_mutableCopy(v29, v73, v74, v75);
                  objc_msgSend_dictionaryRepresentationRecursive_(v72, v73, 1, v75);
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setObject_forKeyedSubscript_(v30, v77, (uint64_t)v76, v71);

                }
              }
              v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v66, (uint64_t)&v95, (uint64_t)v103, 16);
            }
            while (v68);

            if (v30)
            {
              objc_msgSend_v1(v92, v78, v79, v80);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = v89;
              objc_msgSend_setObject_forKeyedSubscript_(v89, v82, (uint64_t)v30, (uint64_t)v81);

              v4 = v90;
              v17 = v88;
              goto LABEL_33;
            }
            v4 = v90;
            v17 = v88;
            v10 = v89;
LABEL_36:
            v16 = v91;
            v19 = v92;
          }
          else
          {

            v16 = v91;
          }
          v18 = v93;
LABEL_38:

        }
LABEL_39:
        objc_msgSend_v2(v19, v13, v14, v15);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_v1(v19, v83, v84, v85);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v10, v86, (uint64_t)v29, (uint64_t)v30);
LABEL_40:

        ++v18;
      }
      while (v18 != v16);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v99, (uint64_t)v104, 16);
    }
    while (v16);
  }

  return v10;
}

@end
