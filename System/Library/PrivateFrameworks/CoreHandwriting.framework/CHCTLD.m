@implementation CHCTLD

- (CHCTLD)init
{
  CHCTLD *v2;
  CRCTLD *v3;
  CRCTLD *ctld;
  uint64_t v5;
  CRCTLDConfig *ctldConfig;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CHCTLD;
  v2 = -[CHCTLD init](&v8, sel_init);
  if (v2)
  {
    v3 = (CRCTLD *)objc_alloc_init(MEMORY[0x1E0DBEC60]);
    ctld = v2->_ctld;
    v2->_ctld = v3;

    sub_1BE716BC0(0);
    v5 = objc_claimAutoreleasedReturnValue();
    ctldConfig = v2->_ctldConfig;
    v2->_ctldConfig = (CRCTLDConfig *)v5;

  }
  return v2;
}

- (CHCTLD)initWithType:(unint64_t)a3
{
  CHCTLD *v4;
  CRCTLD *v5;
  CRCTLD *ctld;
  uint64_t v7;
  CRCTLDConfig *ctldConfig;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CHCTLD;
  v4 = -[CHCTLD init](&v10, sel_init);
  if (v4)
  {
    v5 = (CRCTLD *)objc_alloc_init(MEMORY[0x1E0DBEC60]);
    ctld = v4->_ctld;
    v4->_ctld = v5;

    sub_1BE716BC0(a3);
    v7 = objc_claimAutoreleasedReturnValue();
    ctldConfig = v4->_ctldConfig;
    v4->_ctldConfig = (CRCTLDConfig *)v7;

  }
  return v4;
}

- (id)orderStrokeGroups:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend_groupAndOrderRegions_config_(self->_ctld, a2, (uint64_t)a3, (uint64_t)self->_ctldConfig, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v5;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v29, (uint64_t)v33, 16, v14);
  if (v20)
  {
    v21 = *(_QWORD *)v30;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v12);
        objc_msgSend_subregions(*(void **)(*((_QWORD *)&v29 + 1) + 8 * v22), v15, v16, v17, v18, v19, (_QWORD)v29);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v11, v24, (uint64_t)v23, v25, v26, v27);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v29, (uint64_t)v33, 16, v19);
    }
    while (v20);
  }

  return v11;
}

- (id)strokeGroupRegions:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend_groupAndOrderRegions_config_(self->_ctld, a2, (uint64_t)a3, (uint64_t)self->_ctldConfig, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v5;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v29, (uint64_t)v33, 16, v14);
  if (v20)
  {
    v21 = *(_QWORD *)v30;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v12);
        objc_msgSend_subregions(*(void **)(*((_QWORD *)&v29 + 1) + 8 * v22), v15, v16, v17, v18, v19, (_QWORD)v29);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v11, v24, (uint64_t)v23, v25, v26, v27);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v29, (uint64_t)v33, 16, v19);
    }
    while (v20);
  }

  return v11;
}

- (id)reflowableLineRegions:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend_groupAndOrderRegions_config_(self->_ctld, a2, (uint64_t)a3, (uint64_t)self->_ctldConfig, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v5;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v29, (uint64_t)v33, 16, v14);
  if (v20)
  {
    v21 = *(_QWORD *)v30;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v12);
        objc_msgSend_subregions(*(void **)(*((_QWORD *)&v29 + 1) + 8 * v22), v15, v16, v17, v18, v19, (_QWORD)v29);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v11, v24, (uint64_t)v23, v25, v26, v27);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v29, (uint64_t)v33, 16, v19);
    }
    while (v20);
  }

  return v11;
}

- (id)mergeStrokeGroups:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  double x;
  double y;
  double width;
  double height;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  double v83;
  double v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  double v91;
  double v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v99;
  id v100;
  id obj;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;

  v114 = *MEMORY[0x1E0C80C00];
  objc_msgSend_groupAndOrderRegions_config_(self->_ctld, a2, (uint64_t)a3, (uint64_t)self->_ctldConfig, v3, v4);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6, v7, v8, v9);
  v100 = (id)objc_claimAutoreleasedReturnValue();
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  obj = v99;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v108, (uint64_t)v113, 16, v11);
  if (v12)
  {
    v102 = *(_QWORD *)v109;
    do
    {
      v103 = v12;
      for (i = 0; i != v103; ++i)
      {
        if (*(_QWORD *)v109 != v102)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
        v104 = 0u;
        v105 = 0u;
        v106 = 0u;
        v107 = 0u;
        objc_msgSend_subregions(v19, v13, v14, v15, v16, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v104, (uint64_t)v112, 16, v22);
        if (v28)
        {
          v29 = 0;
          v30 = *(_QWORD *)v105;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              while (1)
              {
                if (*(_QWORD *)v105 != v30)
                  objc_enumerationMutation(v20);
                v32 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * j);
                if (v29)
                  break;
                v29 = v32;
                if (v28 == ++j)
                  goto LABEL_14;
              }
              objc_msgSend_strokeIdentifiers(*(void **)(*((_QWORD *)&v104 + 1) + 8 * j), v23, v24, v25, v26, v27);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_firstStrokeIdentifier(v29, v34, v35, v36, v37, v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_lastStrokeIdentifier(v32, v40, v41, v42, v43, v44);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_bounds(v29, v46, v47, v48, v49, v50);
              v52 = v51;
              v54 = v53;
              v56 = v55;
              v58 = v57;
              objc_msgSend_bounds(v32, v59, v60, v61, v62, v63);
              v117.origin.x = v64;
              v117.origin.y = v65;
              v117.size.width = v66;
              v117.size.height = v67;
              v115.origin.x = v52;
              v115.origin.y = v54;
              v115.size.width = v56;
              v115.size.height = v58;
              v116 = CGRectUnion(v115, v117);
              x = v116.origin.x;
              y = v116.origin.y;
              width = v116.size.width;
              height = v116.size.height;
              v77 = objc_msgSend_classification(v29, v72, v73, v74, v75, v76);
              objc_msgSend_groupingConfidence(v29, v78, v79, v80, v81, v82);
              v84 = v83;
              objc_msgSend_firstStrokeOrigin(v29, v85, v86, v87, v88, v89);
              objc_msgSend_groupByAddingStrokeIdentifiers_removingStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_firstStrokeOrigin_(v29, v90, (uint64_t)v33, 0, (uint64_t)v39, (uint64_t)v45, v77, x, y, width, height, v84, v91, v92);
              v93 = objc_claimAutoreleasedReturnValue();

              v29 = (id)v93;
            }
LABEL_14:
            v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v104, (uint64_t)v112, 16, v27);
          }
          while (v28);

          if (v29)
            objc_msgSend_addObject_(v100, v94, (uint64_t)v29, v95, v96, v97);
        }
        else
        {

          v29 = 0;
        }

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v108, (uint64_t)v113, 16, v17);
    }
    while (v12);
  }

  return v100;
}

- (CRCTLD)ctld
{
  return (CRCTLD *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCtld:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CRCTLDConfig)ctldConfig
{
  return (CRCTLDConfig *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCtldConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctldConfig, 0);
  objc_storeStrong((id *)&self->_ctld, 0);
}

@end
