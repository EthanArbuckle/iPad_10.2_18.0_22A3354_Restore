@implementation CKRecordGraph

- (BOOL)addRecords:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  id v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t k;
  void *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  BOOL v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  const char *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  NSMutableArray *nodes;
  void *v135;
  BOOL v136;
  void *v137;
  void *v138;
  const char *v139;
  void *v142;
  id obj;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  id v152;
  id v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  uint64_t v179;

  v179 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v149 = (void *)objc_opt_new();
  v170 = 0u;
  v171 = 0u;
  v172 = 0u;
  v173 = 0u;
  v8 = v5;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v170, (uint64_t)v178, 16);
  v151 = v7;
  v142 = v8;
  if (!v10)
  {
LABEL_9:

    v168 = 0u;
    v169 = 0u;
    v166 = 0u;
    v167 = 0u;
    obj = v8;
    v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v166, (uint64_t)v177, 16);
    if (!v145)
      goto LABEL_60;
    v144 = *(_QWORD *)v167;
    v150 = v6;
    while (1)
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v167 != v144)
          objc_enumerationMutation(obj);
        v146 = v31;
        v32 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * v31);
        objc_msgSend_objectForKey_(v6, v29, (uint64_t)v32, v30);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v36)
        {
          v36 = (void *)objc_opt_new();
          objc_msgSend_setRecord_(v36, v37, (uint64_t)v32, v38);
          objc_msgSend_setObject_forKey_(v6, v39, (uint64_t)v36, (uint64_t)v32);
          objc_msgSend_addObject_(v149, v40, (uint64_t)v36, v41);
        }
        v147 = v36;
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v33, v34, v35);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v162 = 0u;
        v163 = 0u;
        v164 = 0u;
        v165 = 0u;
        v148 = v32;
        objc_msgSend_valueStore(v32, v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allRawValues(v46, v47, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v162, (uint64_t)v176, 16);
        if (v52)
        {
          v53 = v52;
          v54 = *(_QWORD *)v163;
          v152 = v50;
          do
          {
            for (i = 0; i != v53; ++i)
            {
              if (*(_QWORD *)v163 != v54)
                objc_enumerationMutation(v50);
              v56 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend_addObject_(v42, v57, (uint64_t)v56, v58);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v160 = 0u;
                  v161 = 0u;
                  v158 = 0u;
                  v159 = 0u;
                  v60 = v56;
                  v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v61, (uint64_t)&v158, (uint64_t)v175, 16);
                  if (v62)
                  {
                    v63 = v62;
                    v64 = *(_QWORD *)v159;
                    do
                    {
                      for (j = 0; j != v63; ++j)
                      {
                        if (*(_QWORD *)v159 != v64)
                          objc_enumerationMutation(v60);
                        v66 = *(_QWORD *)(*((_QWORD *)&v158 + 1) + 8 * j);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                          objc_msgSend_addObject_(v42, v67, v66, v68);
                      }
                      v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v67, (uint64_t)&v158, (uint64_t)v175, 16);
                    }
                    while (v63);
                  }

                  v6 = v150;
                  v7 = v151;
                  v50 = v152;
                }
              }
            }
            v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v59, (uint64_t)&v162, (uint64_t)v176, 16);
          }
          while (v53);
        }

        objc_msgSend_parent(v148, v69, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        if (v72)
        {
          objc_msgSend_parent(v148, v73, v74, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v42, v77, (uint64_t)v76, v78);

        }
        objc_msgSend_share(v148, v73, v74, v75);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        if (v79)
        {
          objc_msgSend_share(v148, v80, v81, v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v42, v84, (uint64_t)v83, v85);

        }
        v156 = 0u;
        v157 = 0u;
        v154 = 0u;
        v155 = 0u;
        v153 = v42;
        v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v153, v86, (uint64_t)&v154, (uint64_t)v174, 16);
        v91 = v147;
        if (v87)
        {
          v92 = v87;
          v93 = *(_QWORD *)v155;
          do
          {
            for (k = 0; k != v92; ++k)
            {
              if (*(_QWORD *)v155 != v93)
                objc_enumerationMutation(v153);
              v95 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * k);
              objc_msgSend_recordID(v95, v88, v89, v90);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKey_(v7, v97, (uint64_t)v96, v98);
              v99 = (void *)objc_claimAutoreleasedReturnValue();

              if (v99)
              {
                if (objc_msgSend_referenceAction(v95, v100, v101, v102) != 1
                  && objc_msgSend_referenceAction(v95, v103, v104, v105) != 2)
                {
                  objc_msgSend_parent(v148, v103, v106, v105);
                  v107 = objc_claimAutoreleasedReturnValue();
                  if (v95 == (void *)v107)
                  {

                    v91 = v147;
                  }
                  else
                  {
                    v111 = (void *)v107;
                    objc_msgSend_share(v148, v108, v109, v110);
                    v112 = (void *)objc_claimAutoreleasedReturnValue();

                    v113 = v95 == v112;
                    v7 = v151;
                    v91 = v147;
                    if (!v113)
                      goto LABEL_56;
                  }
                }
                objc_msgSend_objectForKey_(v6, v103, (uint64_t)v99, v105);
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v117)
                {
                  v117 = (void *)objc_opt_new();
                  objc_msgSend_setRecord_(v117, v118, (uint64_t)v99, v119);
                  objc_msgSend_setObject_forKey_(v6, v120, (uint64_t)v117, (uint64_t)v99);
                  objc_msgSend_addObject_(v149, v121, (uint64_t)v117, v122);
                }
                objc_msgSend_edges(v91, v114, v115, v116);
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v123, v124, (uint64_t)v117, v125);

                objc_msgSend_indegrees(v117, v126, v127, v128);
                v129 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v129, v130, (uint64_t)v91, v131);

              }
LABEL_56:

            }
            v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v153, v88, (uint64_t)&v154, (uint64_t)v174, 16);
          }
          while (v92);
        }

        v31 = v146 + 1;
      }
      while (v146 + 1 != v145);
      v145 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v166, (uint64_t)v177, 16);
      if (!v145)
      {
LABEL_60:

        if (self)
          nodes = self->_nodes;
        else
          nodes = 0;
        v135 = v149;
        objc_msgSend_addObjectsFromArray_(nodes, v132, (uint64_t)v149, v133);
        sub_18A77E724((uint64_t)self, 0);
        v136 = 1;
        v137 = v142;
        goto LABEL_66;
      }
    }
  }
  v14 = v10;
  v15 = *(_QWORD *)v171;
LABEL_3:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v171 != v15)
      objc_enumerationMutation(v8);
    v17 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * v16);
    objc_msgSend_recordID(v17, v11, v12, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v7, v19, (uint64_t)v18, v20);
    v21 = v7;
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      break;
    objc_msgSend_recordID(v17, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v21, v27, (uint64_t)v17, (uint64_t)v26);

    ++v16;
    v7 = v21;
    v8 = v142;
    if (v14 == v16)
    {
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v142, v11, (uint64_t)&v170, (uint64_t)v178, 16);
      if (!v14)
        goto LABEL_9;
      goto LABEL_3;
    }
  }
  v135 = v149;
  if (a4)
  {
    objc_msgSend_recordID(v17, v23, v24, v25);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v139, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, CFSTR("Asked to sort multiple records with identical recordID: %@"), v138);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v137 = v142;

  v136 = 0;
  v7 = v151;
LABEL_66:

  return v136;
}

- (CKRecordGraph)init
{
  CKRecordGraph *v2;
  uint64_t v3;
  NSMutableArray *nodes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKRecordGraph;
  v2 = -[CKRecordGraph init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    nodes = v2->_nodes;
    v2->_nodes = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)recordsByTopologicalSortWithError:(id *)a3
{
  NSArray *sortedRecords;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
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
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  NSMutableArray *nodes;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  NSArray *v58;
  NSArray *v59;
  const char *v60;
  uint64_t v61;
  id *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    sortedRecords = self->_sortedRecords;
    if (sortedRecords)
      return sortedRecords;
    v7 = (void *)objc_opt_new();
    objc_msgSend_CKFilter_(self->_nodes, v8, (uint64_t)&unk_1E1F58798, v9);
  }
  else
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend_CKFilter_(0, v60, (uint64_t)&unk_1E1F58798, v61);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_mutableCopy(v10, v11, v12, v13);

  v62 = a3;
  if (self)
    objc_msgSend_removeObjectsInArray_(self->_nodes, v15, (uint64_t)v14, v16);
  else
    objc_msgSend_removeObjectsInArray_(0, v15, (uint64_t)v14, v16);
  while (objc_msgSend_count(v14, v17, v18, v19))
  {
    objc_msgSend_lastObject(v14, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObject_(v14, v24, (uint64_t)v23, v25);
    objc_msgSend_record(v23, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_insertObject_atIndex_(v7, v30, (uint64_t)v29, 0);

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    objc_msgSend_edges(v23, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v63, (uint64_t)v67, 16);
    if (v36)
    {
      v40 = v36;
      v41 = *(_QWORD *)v64;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v64 != v41)
            objc_enumerationMutation(v34);
          v43 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v42);
          objc_msgSend_indegrees(v43, v37, v38, v39);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_removeObject_(v44, v45, (uint64_t)v23, v46);

          if (!objc_msgSend_indegree(v43, v47, v48, v49))
          {
            objc_msgSend_insertObject_atIndex_(v14, v37, (uint64_t)v43, 0);
            if (self)
              objc_msgSend_removeObject_(self->_nodes, v50, (uint64_t)v43, v51);
            else
              objc_msgSend_removeObject_(0, v50, (uint64_t)v43, v51);
          }
          ++v42;
        }
        while (v40 != v42);
        v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v63, (uint64_t)v67, 16);
        v40 = v52;
      }
      while (v52);
    }

  }
  if (self)
    nodes = self->_nodes;
  else
    nodes = 0;
  if (objc_msgSend_count(nodes, v20, v21, v22))
  {
    if (self)
      objc_msgSend_removeAllObjects(self->_nodes, v54, v55, v56);
    else
      objc_msgSend_removeAllObjects(0, v54, v55, v56);
    if (v62)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v57, (uint64_t)CFSTR("CKInternalErrorDomain"), 1017, CFSTR("Cycle detected in record graph"));
      v58 = 0;
      *v62 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v58 = 0;
    }
  }
  else
  {
    sub_18A77E724((uint64_t)self, v7);
    if (self)
      v59 = self->_sortedRecords;
    else
      v59 = 0;
    v58 = v59;
  }

  return v58;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;

  if (self)
    self = (CKRecordGraph *)self->_nodes;
  return (id)objc_msgSend_description(self, a2, v2, v3);
}

+ (id)topologicallySortRecords:(id)a3 withError:(id *)a4
{
  id v5;
  CKRecordGraph *v6;
  const char *v7;
  int v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v17;
  id v18;

  v5 = a3;
  v6 = objc_alloc_init(CKRecordGraph);
  v18 = 0;
  v8 = objc_msgSend_addRecords_error_(v6, v7, (uint64_t)v5, (uint64_t)&v18);

  v9 = v18;
  v13 = v9;
  if (v8)
  {
    v17 = v9;
    objc_msgSend_recordsByTopologicalSortWithError_(v6, v10, (uint64_t)&v17, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v17;

    v13 = v15;
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    v14 = 0;
    if (!a4)
      goto LABEL_7;
  }
  if (v13)
  {
    objc_msgSend_CKClientSuitableError(v13, v10, v11, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedRecords, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

@end
