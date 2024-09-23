@implementation MDLMaterialPropertyGraph

- (MDLMaterialPropertyGraph)initWithNodes:(NSArray *)nodes connections:(NSArray *)connections
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  const char *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  void *v41;
  const char *v42;
  char v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  objc_class *v47;
  void *v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  char v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  objc_class *v57;
  void *v58;
  void *v59;
  const char *v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  void **v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t m;
  id *v82;
  id *v83;
  id WeakRetained;
  id *v85;
  id v86;
  id *v87;
  const char *v88;
  id v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t n;
  uint64_t v95;
  id v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t ii;
  uint64_t v102;
  const char *v103;
  void *v104;
  const char *v105;
  MDLMaterialPropertyGraph *v106;
  MDLMaterialPropertyGraph *v107;
  MDLMaterialPropertyGraph *v108;
  NSArray *v110;
  NSArray *v111;
  NSArray *v112;
  NSArray *v113;
  NSArray *obj;
  id v115;
  char *aSelectora;
  NSArray *v118;
  NSArray *v119;
  uint64_t v121;
  id v122;
  uint64_t v123;
  id v124;
  objc_super v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  uint64_t v161;

  v161 = *MEMORY[0x1E0C80C00];
  v113 = nodes;
  v112 = connections;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v111 = nodes;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v110 = connections;
  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  obj = v113;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v150, v160, 16);
  if (v12)
  {
    v121 = *(_QWORD *)v151;
    do
    {
      v13 = 0;
      v123 = v12;
      do
      {
        if (*(_QWORD *)v151 != v121)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * v13);
        v146 = 0u;
        v147 = 0u;
        v148 = 0u;
        v149 = 0u;
        objc_msgSend_inputs(v14, v10, v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v146, v159, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v147;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v147 != v19)
                objc_enumerationMutation(v15);
              objc_msgSend_addObject_(v6, v17, *(_QWORD *)(*((_QWORD *)&v146 + 1) + 8 * i));
            }
            v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v146, v159, 16);
          }
          while (v18);
        }

        v144 = 0u;
        v145 = 0u;
        v142 = 0u;
        v143 = 0u;
        objc_msgSend_outputs(v14, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v142, v158, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v143;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v143 != v27)
                objc_enumerationMutation(v23);
              v29 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * j);
              objc_msgSend_addObject_(v7, v25, v29);
              objc_msgSend_setObject_forKey_(v8, v30, (uint64_t)v14, v29);
            }
            v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v25, (uint64_t)&v142, v158, 16);
          }
          while (v26);
        }

        ++v13;
      }
      while (v13 != v123);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v150, v160, 16);
    }
    while (v12);
  }

  v124 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v122 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v118 = v112;
  v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v31, (uint64_t)&v138, v157, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v139;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v139 != v35)
          objc_enumerationMutation(v118);
        v37 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * k);
        objc_msgSend_output(v37, v32, v33);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          objc_msgSend_input(v37, v32, v33);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v39 == 0;

          if (!v40)
          {
            objc_msgSend_output(v37, v32, v33);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend_containsObject_(v7, v42, (uint64_t)v41);

            if ((v43 & 1) == 0)
            {
              v46 = (void *)MEMORY[0x1E0C99DA0];
              v47 = (objc_class *)objc_opt_class();
              NSStringFromClass(v47);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_raise_format_(v46, v50, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: output connection not found in node outputs"), v48, v49);

            }
            objc_msgSend_input(v37, v44, v45);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend_containsObject_(v6, v52, (uint64_t)v51);

            if ((v53 & 1) == 0)
            {
              v56 = (void *)MEMORY[0x1E0C99DA0];
              v57 = (objc_class *)objc_opt_class();
              NSStringFromClass(v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_raise_format_(v56, v60, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: output connection not found in node inputs"), v58, v59);

            }
            objc_msgSend_input(v37, v54, v55);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v124, v62, (uint64_t)v61);

            objc_msgSend_output(v37, v63, v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v122, v66, (uint64_t)v65);

            objc_msgSend_input(v37, v67, v68);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v8, v70, (uint64_t)v69);
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_output(v37, v72, v73);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v8, v75, (uint64_t)v74);
            v76 = (void **)objc_claimAutoreleasedReturnValue();

            objc_msgSend_addObject_(v76[3], v77, (uint64_t)v71);
          }
        }
      }
      v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v32, (uint64_t)&v138, v157, 16);
    }
    while (v34);
  }

  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  v119 = v118;
  v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v78, (uint64_t)&v134, v156, 16);
  if (v79)
  {
    v80 = *(_QWORD *)v135;
    do
    {
      for (m = 0; m != v79; ++m)
      {
        if (*(_QWORD *)v135 != v80)
          objc_enumerationMutation(v119);
        v82 = *(id **)(*((_QWORD *)&v134 + 1) + 8 * m);
        v83 = v82 + 1;
        WeakRetained = objc_loadWeakRetained(v82 + 1);
        v82 += 2;
        v85 = (id *)objc_loadWeakRetained(v82);
        objc_storeWeak(v85 + 22, WeakRetained);

        v86 = objc_loadWeakRetained(v82);
        v87 = (id *)objc_loadWeakRetained(v83);
        objc_storeWeak(v87 + 21, v86);

      }
      v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v88, (uint64_t)&v134, v156, 16);
    }
    while (v79);
  }

  aSelectora = (char *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v115 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v89 = v6;
  v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v90, (uint64_t)&v130, v155, 16);
  if (v92)
  {
    v93 = *(_QWORD *)v131;
    do
    {
      for (n = 0; n != v92; ++n)
      {
        if (*(_QWORD *)v131 != v93)
          objc_enumerationMutation(v89);
        v95 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * n);
        if ((objc_msgSend_containsObject_(v124, v91, v95) & 1) == 0)
          objc_msgSend_addObject_(aSelectora, v91, v95);
      }
      v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v91, (uint64_t)&v130, v155, 16);
    }
    while (v92);
  }

  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v96 = v7;
  v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v96, v97, (uint64_t)&v126, v154, 16);
  if (v99)
  {
    v100 = *(_QWORD *)v127;
    do
    {
      for (ii = 0; ii != v99; ++ii)
      {
        if (*(_QWORD *)v127 != v100)
          objc_enumerationMutation(v96);
        v102 = *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * ii);
        if ((objc_msgSend_containsObject_(v122, v98, v102) & 1) == 0)
        {
          objc_msgSend_addObject_(v115, v98, v102);
          objc_msgSend_objectForKey_(v8, v103, v102);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(self->_finalNodes, v105, (uint64_t)v104);

        }
      }
      v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v96, v98, (uint64_t)&v126, v154, 16);
    }
    while (v99);
  }

  v125.receiver = self;
  v125.super_class = (Class)MDLMaterialPropertyGraph;
  v106 = -[MDLMaterialPropertyNode initWithInputs:outputs:evaluationFunction:](&v125, sel_initWithInputs_outputs_evaluationFunction_, aSelectora, v115, &unk_1EA576450);
  v107 = v106;
  if (v106)
  {
    objc_storeStrong((id *)&v106->_nodes, v111);
    objc_storeStrong((id *)&v107->_connections, v110);
    v108 = v107;
  }

  return v107;
}

- (void)evaluate
{
  id v3;
  NSMutableArray *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_finalNodes;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        sub_1DCAEC1B0(*(void **)(*((_QWORD *)&v10 + 1) + 8 * v8++), v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v9, (uint64_t)&v10, v14, 16);
    }
    while (v6);
  }

}

- (NSArray)nodes
{
  return self->_nodes;
}

- (NSArray)connections
{
  return self->_connections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalNodes, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

@end
