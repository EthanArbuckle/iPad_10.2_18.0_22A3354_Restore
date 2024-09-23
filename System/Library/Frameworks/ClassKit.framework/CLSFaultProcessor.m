@implementation CLSFaultProcessor

+ (id)rootClasses
{
  if (qword_1ED0FB7B8 != -1)
    dispatch_once(&qword_1ED0FB7B8, &unk_1E9749AF0);
  return (id)qword_1ED0FB7C0;
}

- (CLSFaultProcessor)initWithDelegate:(id)a3
{
  id v4;
  CLSFaultProcessor *v5;
  CLSFaultProcessor *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  dispatch_group_t v15;
  OS_dispatch_group *group;
  const char *v17;
  uint64_t v18;
  NSMapTable *objects;
  const char *v20;
  uint64_t v21;
  NSMapTable *relations;
  const char *v23;
  uint64_t v24;
  NSMapTable *objectsIdsByParentID;
  uint64_t v26;
  NSMutableOrderedSet *rootObjectIDs;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CLSFaultProcessor;
  v5 = -[CLSFaultProcessor init](&v29, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    CLSDispatchQueueName(v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (const char *)objc_msgSend_UTF8String(v7, v8, v9);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    if (qword_1ED0FB7D0 != -1)
      dispatch_once(&qword_1ED0FB7D0, &unk_1E974B7B0);
    v12 = (id)qword_1ED0FB7C8;
    v13 = dispatch_queue_create_with_target_V2(v10, v11, v12);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    v15 = dispatch_group_create();
    group = v6->_group;
    v6->_group = (OS_dispatch_group *)v15;

    objc_msgSend_mapTableWithKeyOptions_valueOptions_(MEMORY[0x1E0CB3748], v17, 0, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    objects = v6->_objects;
    v6->_objects = (NSMapTable *)v18;

    objc_msgSend_mapTableWithKeyOptions_valueOptions_(MEMORY[0x1E0CB3748], v20, 0, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    relations = v6->_relations;
    v6->_relations = (NSMapTable *)v21;

    objc_msgSend_mapTableWithKeyOptions_valueOptions_(MEMORY[0x1E0CB3748], v23, 0, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    objectsIdsByParentID = v6->_objectsIdsByParentID;
    v6->_objectsIdsByParentID = (NSMapTable *)v24;

    v26 = objc_opt_new();
    rootObjectIDs = v6->_rootObjectIDs;
    v6->_rootObjectIDs = (NSMutableOrderedSet *)v26;

  }
  return v6;
}

- (void)faultObject:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend_arrayWithObjects_count_(v4, v6, (uint64_t)&v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_faultObjects_(self, v8, (uint64_t)v7, v9, v10);
}

- (void)faultObjects:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D40A4B48;
  v7[3] = &unk_1E974B728;
  v8 = v4;
  v5 = v4;
  objc_msgSend__inGroup_(self, v6, (uint64_t)v7);

}

- (void)enumerate:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  NSMutableOrderedSet *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  void *v23;
  const char *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend_keyEnumerator(self->_objects, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v5, v12, (uint64_t)v11);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v13 = self->_rootObjectIDs;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v40, v45, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v41;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v41 != v17)
          objc_enumerationMutation(v13);
        v19 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v18);
        v20 = (void *)MEMORY[0x1D82573E4]();
        objc_msgSend_objectForKey_(self->_objects, v21, v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend__descendIntoObject_idsToProcess_enumerationBlock_(self, v22, (uint64_t)v23, v5, v4);

        objc_autoreleasePoolPop(v20);
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v24, (uint64_t)&v40, v45, 16);
    }
    while (v16);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v25 = v5;
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v36, v44, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v37;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v37 != v29)
          objc_enumerationMutation(v25);
        v31 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v30);
        v32 = (void *)MEMORY[0x1D82573E4](v27);
        objc_msgSend_objectForKey_(self->_objects, v33, v31, (_QWORD)v36);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
          v4[2](v4, v34);

        objc_autoreleasePoolPop(v32);
        ++v30;
      }
      while (v28 != v30);
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v35, (uint64_t)&v36, v44, 16);
      v28 = v27;
    }
    while (v27);
  }

}

- (void)_descendIntoObject:(id)a3 idsToProcess:(id)a4 enumerationBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  objc_msgSend_identity(v8, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_identity(v8, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v9, v17, (uint64_t)v16);

  v10[2](v10, v8);
  v31 = (void *)v13;
  objc_msgSend_objectForKey_(self->_objectsIdsByParentID, v18, v13);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v32, v36, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v33;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v19);
        v25 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v24);
        v26 = (void *)MEMORY[0x1D82573E4]();
        objc_msgSend_objectForKey_(self->_objects, v27, v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
          objc_msgSend__descendIntoObject_idsToProcess_enumerationBlock_(self, v28, (uint64_t)v29, v9, v10);

        objc_autoreleasePoolPop(v26);
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v30, (uint64_t)&v32, v36, 16);
    }
    while (v22);
  }

}

- (void)completionNotify:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D40A4FD4;
  v7[3] = &unk_1E974B750;
  v8 = v4;
  v5 = v4;
  objc_msgSend__inGroup_(self, v6, (uint64_t)v7);

}

- (BOOL)waitUntilDone:(double)a3
{
  dispatch_block_t v5;
  id v6;
  const char *v7;
  dispatch_time_t v8;
  _QWORD v10[4];
  id v11;

  v5 = dispatch_block_create((dispatch_block_flags_t)0, &unk_1E974B770);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1D40A50A8;
  v10[3] = &unk_1E9749DE8;
  v11 = v5;
  v6 = v5;
  objc_msgSend_completionNotify_(self, v7, (uint64_t)v10);
  v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  LOBYTE(self) = dispatch_block_wait(v6, v8) != 0;

  return (char)self;
}

- (void)_faultObjectsBatch:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  _BOOL4 v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t i;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  void *v30;
  void *v31;
  const char *v32;
  id v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  objc_class *v44;
  void *v45;
  const char *v46;
  void *v47;
  _BOOL4 v48;
  const char *v49;
  void *v50;
  const char *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  const char *v60;
  id v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t k;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  void *v77;
  const char *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  void *v84;
  const char *v85;
  void *v86;
  const char *v87;
  id obj;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  id v93;
  id v94;
  void *v95;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  _QWORD v100[4];
  id v101;
  id location;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v95 = (void *)objc_opt_new();
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  obj = v3;
  v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v115, v122, 16);
  if (v90)
  {
    v89 = *(_QWORD *)v116;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v116 != v89)
        {
          v6 = v5;
          objc_enumerationMutation(obj);
          v5 = v6;
        }
        v92 = v5;
        v7 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v5);
        v8 = (void *)objc_opt_class();
        if (!objc_msgSend_conformsToProtocol_(v8, v9, (uint64_t)&unk_1EFE376C0))
          goto LABEL_39;
        v93 = v7;
        objc_msgSend_identity(v93, v11, v12);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(self->_objects, v13, (uint64_t)v91);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14 == 0;

        if (!v15)
          goto LABEL_38;
        objc_msgSend__addObject_(self, v16, (uint64_t)v93);
        objc_msgSend_relations(v8, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = 0u;
        v114 = 0u;
        v111 = 0u;
        v112 = 0u;
        v94 = v19;
        v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v20, (uint64_t)&v111, v121, 16);
        if (!v98)
          goto LABEL_37;
        v97 = *(_QWORD *)v112;
        do
        {
          for (i = 0; i != v98; ++i)
          {
            if (*(_QWORD *)v112 != v97)
              objc_enumerationMutation(v94);
            v22 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
            v23 = (void *)MEMORY[0x1D82573E4]();
            if (objc_msgSend_isFaultable(v22, v24, v25))
            {
              objc_msgSend_fromKey(v22, v26, v27);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_valueForKey_(v93, v28, (uint64_t)v99);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (v30)
              {
                objc_msgSend_objectForKey_(self->_relations, v29, (uint64_t)v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v31)
                {
                  v31 = (void *)objc_opt_new();
                  objc_msgSend_setObject_forKey_(self->_relations, v32, (uint64_t)v31, v30);
                }
                v109 = 0u;
                v110 = 0u;
                v107 = 0u;
                v108 = 0u;
                v33 = v31;
                v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v107, v120, 16);
                if (v36)
                {
                  v37 = 0;
                  v38 = *(_QWORD *)v108;
                  do
                  {
                    for (j = 0; j != v36; ++j)
                    {
                      if (*(_QWORD *)v108 != v38)
                        objc_enumerationMutation(v33);
                      v40 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * j);
                      if ((objc_msgSend_isInverseOfRelation_(v40, v35, (uint64_t)v22) & 1) != 0
                        || objc_msgSend_isEquivalentToRelation_(v40, v35, (uint64_t)v22))
                      {
                        v37 = 1;
                      }
                    }
                    v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v35, (uint64_t)&v107, v120, 16);
                  }
                  while (v36);

                  if ((v37 & 1) != 0)
                  {
LABEL_33:

                    goto LABEL_34;
                  }
                }
                else
                {

                }
                objc_msgSend_addObject_(v33, v41, (uint64_t)v22);
                v44 = (objc_class *)objc_msgSend_toEntity(v22, v42, v43);
                NSStringFromClass(v44);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_valueForKey_(v95, v46, (uint64_t)v45);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = v47 == 0;

                if (v48)
                {
                  v50 = (void *)objc_opt_new();
                  objc_msgSend_setValue_forKey_(v95, v51, (uint64_t)v50, v45);

                  objc_msgSend_objectForKeyedSubscript_(v95, v52, (uint64_t)v45);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_toKey(v22, v54, v55);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_addObject_(v53, v57, (uint64_t)v56);

                }
                objc_msgSend_objectForKeyedSubscript_(v95, v49, (uint64_t)v45);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v58, v59, (uint64_t)v30);

                goto LABEL_33;
              }
LABEL_34:

            }
            objc_autoreleasePoolPop(v23);
          }
          v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v60, (uint64_t)&v111, v121, 16);
        }
        while (v98);
LABEL_37:

LABEL_38:
LABEL_39:
        v5 = v92 + 1;
      }
      while (v92 + 1 != v90);
      v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v115, v122, 16);
    }
    while (v90);
  }

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v61 = v95;
  v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v62, (uint64_t)&v103, v119, 16);
  if (v64)
  {
    v65 = *(_QWORD *)v104;
    do
    {
      for (k = 0; k != v64; ++k)
      {
        if (*(_QWORD *)v104 != v65)
          objc_enumerationMutation(v61);
        v67 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * k);
        objc_msgSend_objectForKeyedSubscript_(v61, v63, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v68, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectForKeyedSubscript_(v61, v72, v67);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObjectAtIndex_(v73, v74, 0);

        v75 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend_objectForKeyedSubscript_(v61, v76, v67);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_predicateWithFormat_(v75, v78, (uint64_t)CFSTR("%K IN %@"), v71, v77);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        dispatch_group_enter((dispatch_group_t)self->_group);
        objc_initWeak(&location, self);
        objc_msgSend_delegate(self, v80, v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v100[0] = MEMORY[0x1E0C809B0];
        v100[1] = 3221225472;
        v100[2] = sub_1D40A5748;
        v100[3] = &unk_1E974B650;
        objc_copyWeak(&v101, &location);
        objc_msgSend_dataServer_(v82, v83, (uint64_t)v100);
        v84 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_querySpecificationWithObjectName_predicate_(CLSQuerySpecification, v85, v67, v79);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_remote_executeQuery_querySpecification_searchSpecification_issueServerRequest_completion_(v84, v87, (uint64_t)self, v86, 0, 1, &unk_1E974B790);

        objc_destroyWeak(&v101);
        objc_destroyWeak(&location);

      }
      v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v63, (uint64_t)&v103, v119, 16);
    }
    while (v64);
  }

}

- (void)_addObject:(id)a3
{
  const char *v4;
  void *v5;
  const char *v6;
  int isRootObject_withRelation;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  void *v19;
  const char *v20;
  id v21;

  v21 = a3;
  objc_msgSend__childParentRelationForObject_(self, v4, (uint64_t)v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isRootObject_withRelation = objc_msgSend__isRootObject_withRelation_(self, v6, (uint64_t)v21, v5);
  objc_msgSend_identity(v21, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(self->_objects, v11, (uint64_t)v21, v10);
  if (isRootObject_withRelation)
  {
    objc_msgSend__insertRootObject_(self, v12, (uint64_t)v21);
  }
  else
  {
    objc_msgSend_fromKey(v5, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueForKey_(v21, v15, (uint64_t)v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKey_(self->_objectsIdsByParentID, v17, (uint64_t)v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v19 = (void *)objc_opt_new();
      objc_msgSend_setObject_forKey_(self->_objectsIdsByParentID, v20, (uint64_t)v19, v16);
    }
    objc_msgSend_addObject_(v19, v18, (uint64_t)v10);

  }
}

- (void)_insertRootObject:(id)a3
{
  CLSFaultProcessor *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  int v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  char isKindOfClass;
  NSMutableOrderedSet *rootObjectIDs;
  id v20;

  v20 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_identity(v20, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rootClasses(CLSFaultProcessor, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v13 = objc_msgSend_containsObject_(v10, v12, v11);

  if (v13)
  {
    objc_msgSend_objectForKey_(v4->_objectsIdsByParentID, v14, (uint64_t)v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend__insertRootObjectID_withChildren_(v4, v15, (uint64_t)v7, v16);
    else
      objc_msgSend_addObject_(v4->_rootObjectIDs, v15, (uint64_t)v7);

  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    rootObjectIDs = v4->_rootObjectIDs;
    if ((isKindOfClass & 1) != 0)
      objc_msgSend_insertObject_atIndex_(rootObjectIDs, v17, (uint64_t)v7, 0);
    else
      objc_msgSend_addObject_(rootObjectIDs, v17, (uint64_t)v7);
  }

  objc_sync_exit(v4);
}

- (void)_insertRootObjectID:(id)a3 withChildren:(id)a4
{
  id v6;
  id v7;
  NSMutableOrderedSet *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = self->_rootObjectIDs;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v21, v25, 16);
  if (v10)
  {
    v12 = v10;
    v13 = 0;
    v14 = *(_QWORD *)v22;
    while (2)
    {
      v15 = 0;
      v16 = v12 + v13;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v8);
        if ((objc_msgSend_containsObject_(v7, v11, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15), (_QWORD)v21) & 1) != 0)
        {
          v16 = v13 + v15;
          goto LABEL_12;
        }
        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v21, v25, 16);
      v13 = v16;
      if (v12)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
  }
LABEL_12:

  v19 = objc_msgSend_count(self->_rootObjectIDs, v17, v18);
  if (v16 >= v19 - 1)
    objc_msgSend_insertObject_atIndex_(self->_rootObjectIDs, v20, (uint64_t)v6, v19 - 1, (_QWORD)v21);
  else
    objc_msgSend_insertObject_atIndex_(self->_rootObjectIDs, v20, (uint64_t)v6, v16, (_QWORD)v21);

}

- (BOOL)_isRootObject:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;

  v4 = a3;
  objc_msgSend__childParentRelationForObject_(self, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend__isRootObject_withRelation_(self, v7, (uint64_t)v4, v6);

  return (char)self;
}

- (BOOL)_isRootObject:(id)a3 withRelation:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  char v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend_rootClasses(CLSFaultProcessor, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v12 = objc_msgSend_containsObject_(v9, v11, v10);

  if (v6)
  {
    objc_msgSend_fromKey(v6, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueForKey_(v5, v16, (uint64_t)v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      v12 = 1;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (id)_childParentRelationForObject:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  const char *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (void *)objc_opt_class();
  objc_msgSend_relations(v3, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_inGroup:(id)a3
{
  id v4;
  NSObject *queue;
  NSObject *v6;
  OS_dispatch_queue **p_queue;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  p_queue = &self->_queue;
  queue = self->_queue;
  v6 = p_queue[1];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40A5DFC;
  block[3] = &unk_1E974B678;
  objc_copyWeak(&v11, &location);
  v10 = v4;
  v8 = v4;
  dispatch_group_async(v6, queue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)clientRemote_deliverObject:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D40A5EC0;
  v7[3] = &unk_1E974B728;
  v8 = v4;
  v5 = v4;
  objc_msgSend__inGroup_(self, v6, (uint64_t)v7);

}

- (void)clientRemote_finishWithOffset:(unint64_t)a3 error:(id)a4
{
  dispatch_group_leave((dispatch_group_t)self->_group);
}

- (CLSFaultProcessorDelegate)delegate
{
  return (CLSFaultProcessorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rootObjectIDs, 0);
  objc_storeStrong((id *)&self->_objectsIdsByParentID, 0);
  objc_storeStrong((id *)&self->_relations, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
