@implementation CHStrokeGroupingResult

- (CHStrokeGroupingResult)init
{
  NSObject *v3;
  uint8_t v5[16];

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BE607000, v3, OS_LOG_TYPE_FAULT, "Use the designated initializer instead", v5, 2u);
  }

  return 0;
}

- (CHStrokeGroupingResult)initWithStrokeGroups:(id)a3 createdStrokeGroups:(id)a4 deletedStrokeGroups:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CHStrokeGroupingResult *v16;
  uint64_t v17;
  NSSet *strokeGroups;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSSet *createdStrokeGroups;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSSet *deletedStrokeGroups;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::set<unsigned long>, std::vector<std::unordered_map<unsigned long, float>>>, void *>>> *p_pair1;
  _QWORD *v34;
  unint64_t v35;
  _QWORD *v37;
  _QWORD *v38;
  unint64_t v39;
  objc_super v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)CHStrokeGroupingResult;
  v16 = -[CHStrokeGroupingResult init](&v40, sel_init);
  if (v16)
  {
    v17 = objc_msgSend_copy(v8, v11, v12, v13, v14, v15);
    strokeGroups = v16->_strokeGroups;
    v16->_strokeGroups = (NSSet *)v17;

    v24 = objc_msgSend_copy(v9, v19, v20, v21, v22, v23);
    createdStrokeGroups = v16->_createdStrokeGroups;
    v16->_createdStrokeGroups = (NSSet *)v24;

    v31 = objc_msgSend_copy(v10, v26, v27, v28, v29, v30);
    deletedStrokeGroups = v16->_deletedStrokeGroups;
    v16->_deletedStrokeGroups = (NSSet *)v31;

    v38 = 0;
    v39 = 0;
    v37 = &v38;
    p_pair1 = &v16->_cachedAdjacencies.__tree_.__pair1_;
    sub_1BE6B4610((uint64_t)&v16->_cachedAdjacencies, (_QWORD *)v16->_cachedAdjacencies.__tree_.__pair1_.__value_.__left_);
    v34 = v38;
    v16->_cachedAdjacencies.__tree_.__begin_node_ = &v38;
    v16->_cachedAdjacencies.__tree_.__pair1_.__value_.__left_ = v34;
    v35 = v39;
    v16->_cachedAdjacencies.__tree_.__pair3_.__value_ = v39;
    if (v35)
    {
      v34[2] = p_pair1;
      v37 = &v38;
      v38 = 0;
      v39 = 0;
      v34 = 0;
    }
    else
    {
      v16->_cachedAdjacencies.__tree_.__begin_node_ = p_pair1;
    }
    sub_1BE6B4610((uint64_t)&v37, v34);
  }

  return v16;
}

- (CHStrokeGroupingResult)initWithStrokeGroups:(id)a3 createdStrokeGroups:(id)a4 deletedStrokeGroups:(id)a5 cachedAdjacencies:(const void *)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD **v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char **v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  char **v46;
  char **v47;
  char *v48;
  char *v49;
  char *v50;
  unint64_t v51;
  unint64_t v52;
  char *v53;
  char *v54;
  BOOL v55;
  char *v56;
  char *v57;
  _QWORD *v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  _QWORD *v63;
  char *i;
  uint64_t **v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t **v68;
  uint64_t **v69;
  uint64_t *v70;
  uint64_t *v71;
  _QWORD *v72;
  unint64_t v73;
  unint64_t v74;
  _QWORD *v75;
  _QWORD *v76;
  uint64_t *v77;
  uint64_t *v78;
  _QWORD *v79;
  char *v80;
  char *v81;
  char *v83;
  id v84;
  objc_super v85;
  _QWORD *v86;
  char *v87;
  char *v88;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v85.receiver = self;
  v85.super_class = (Class)CHStrokeGroupingResult;
  v18 = -[CHStrokeGroupingResult init](&v85, sel_init);
  if (v18)
  {
    v19 = objc_msgSend_copy(v10, v13, v14, v15, v16, v17);
    v20 = (void *)*((_QWORD *)v18 + 12);
    *((_QWORD *)v18 + 12) = v19;

    v26 = objc_msgSend_copy(v11, v21, v22, v23, v24, v25);
    v27 = (void *)*((_QWORD *)v18 + 13);
    *((_QWORD *)v18 + 13) = v26;

    v33 = objc_msgSend_copy(v12, v28, v29, v30, v31, v32);
    v34 = (void *)*((_QWORD *)v18 + 14);
    *((_QWORD *)v18 + 14) = v33;

    v35 = (_QWORD **)(v18 + 72);
    if (v18 + 72 != a6)
    {
      v38 = *(char **)a6;
      v37 = (char *)a6 + 8;
      v36 = v38;
      if (*((_QWORD *)v18 + 11))
      {
        v40 = (char **)(v18 + 80);
        v39 = *((_QWORD *)v18 + 10);
        v41 = (char *)*((_QWORD *)v18 + 9);
        *((_QWORD *)v18 + 9) = v18 + 80;
        *(_QWORD *)(v39 + 16) = 0;
        *((_QWORD *)v18 + 10) = 0;
        *((_QWORD *)v18 + 11) = 0;
        if (*((_QWORD *)v41 + 1))
          v42 = (char *)*((_QWORD *)v41 + 1);
        else
          v42 = v41;
        v86 = v18 + 72;
        v88 = v42;
        if (v42)
        {
          v84 = v10;
          v43 = (char *)*((_QWORD *)v42 + 2);
          if (v43)
          {
            v44 = *(char **)v43;
            if (*(char **)v43 == v42)
            {
              *(_QWORD *)v43 = 0;
              while (1)
              {
                v83 = (char *)*((_QWORD *)v43 + 1);
                if (!v83)
                  break;
                do
                {
                  v43 = v83;
                  v83 = *(char **)v83;
                }
                while (v83);
              }
            }
            else
            {
              for (*((_QWORD *)v43 + 1) = 0; v44; v44 = (char *)*((_QWORD *)v43 + 1))
              {
                do
                {
                  v43 = v44;
                  v44 = *(char **)v44;
                }
                while (v44);
              }
            }
          }
          v87 = v43;
          if (v36 != v37)
          {
            while (1)
            {
              if (v42 != v36)
              {
                sub_1BE66B2E4((uint64_t)(v42 + 32), *((_QWORD **)v36 + 4), (_QWORD *)v36 + 5);
                sub_1BE6C8C20((void **)v42 + 7, *((_QWORD *)v36 + 7), *((_QWORD *)v36 + 8), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)v36 + 8) - *((_QWORD *)v36 + 7)) >> 3));
                v42 = v88;
              }
              v45 = *v40;
              v46 = (char **)(v18 + 80);
              v47 = (char **)(v18 + 80);
              if (*v40)
              {
                do
                {
                  while (1)
                  {
                    v46 = (char **)v45;
                    v48 = (char *)*((_QWORD *)v45 + 4);
                    v49 = v45 + 40;
                    if (v48 == v45 + 40)
                      break;
                    v50 = (char *)*((_QWORD *)v42 + 4);
                    while (v50 != v42 + 40)
                    {
                      v51 = *((_QWORD *)v50 + 4);
                      v52 = *((_QWORD *)v48 + 4);
                      if (v51 < v52)
                        break;
                      if (v52 >= v51)
                      {
                        v53 = (char *)*((_QWORD *)v50 + 1);
                        v54 = v50;
                        if (v53)
                        {
                          do
                          {
                            v50 = v53;
                            v53 = *(char **)v53;
                          }
                          while (v53);
                        }
                        else
                        {
                          do
                          {
                            v50 = (char *)*((_QWORD *)v54 + 2);
                            v55 = *(_QWORD *)v50 == (_QWORD)v54;
                            v54 = v50;
                          }
                          while (!v55);
                        }
                        v56 = (char *)*((_QWORD *)v48 + 1);
                        if (v56)
                        {
                          do
                          {
                            v57 = v56;
                            v56 = *(char **)v56;
                          }
                          while (v56);
                        }
                        else
                        {
                          do
                          {
                            v57 = (char *)*((_QWORD *)v48 + 2);
                            v55 = *(_QWORD *)v57 == (_QWORD)v48;
                            v48 = v57;
                          }
                          while (!v55);
                        }
                        v48 = v57;
                        if (v57 != v49)
                          continue;
                      }
                      goto LABEL_18;
                    }
                    v45 = *v46;
                    v47 = v46;
                    if (!*v46)
                      goto LABEL_39;
                  }
LABEL_18:
                  v45 = v46[1];
                }
                while (v45);
                v47 = v46 + 1;
              }
LABEL_39:
              *(_QWORD *)v42 = 0;
              *((_QWORD *)v42 + 1) = 0;
              *((_QWORD *)v42 + 2) = v46;
              *v47 = v42;
              v58 = (_QWORD *)**v35;
              if (v58)
              {
                *v35 = v58;
                v42 = *v47;
              }
              sub_1BE61F5C0(*((uint64_t **)v18 + 10), (uint64_t *)v42);
              ++*((_QWORD *)v18 + 11);
              v42 = v87;
              v88 = v87;
              if (v87)
              {
                v43 = (char *)*((_QWORD *)v87 + 2);
                if (v43)
                {
                  v59 = *(char **)v43;
                  if (*(char **)v43 == v87)
                  {
                    *(_QWORD *)v43 = 0;
                    while (1)
                    {
                      v62 = (char *)*((_QWORD *)v43 + 1);
                      if (!v62)
                        break;
                      do
                      {
                        v43 = v62;
                        v62 = *(char **)v62;
                      }
                      while (v62);
                    }
                  }
                  else
                  {
                    for (*((_QWORD *)v43 + 1) = 0; v59; v59 = (char *)*((_QWORD *)v43 + 1))
                    {
                      do
                      {
                        v43 = v59;
                        v59 = *(char **)v59;
                      }
                      while (v59);
                    }
                  }
                }
                v87 = v43;
                v60 = (char *)*((_QWORD *)v36 + 1);
                if (v60)
                {
                  do
                  {
LABEL_50:
                    v61 = v60;
                    v60 = *(char **)v60;
                  }
                  while (v60);
                  goto LABEL_54;
                }
              }
              else
              {
                v43 = 0;
                v60 = (char *)*((_QWORD *)v36 + 1);
                if (v60)
                  goto LABEL_50;
              }
              do
              {
                v61 = (char *)*((_QWORD *)v36 + 2);
                v55 = *(_QWORD *)v61 == (_QWORD)v36;
                v36 = v61;
              }
              while (!v55);
LABEL_54:
              if (v42)
              {
                v36 = v61;
                if (v61 != v37)
                  continue;
              }
              v63 = v86;
              sub_1BE6B4610((uint64_t)v86, v42);
              if (!v43)
                goto LABEL_68;
              goto LABEL_65;
            }
          }
          v63 = v18 + 72;
          v61 = v36;
          sub_1BE6B4610((uint64_t)(v18 + 72), v42);
          if (!v43)
            goto LABEL_68;
LABEL_65:
          for (i = (char *)*((_QWORD *)v43 + 2); i; i = (char *)*((_QWORD *)i + 2))
            v43 = i;
          sub_1BE6B4610((uint64_t)v63, v43);
LABEL_68:
          v10 = v84;
        }
        else
        {
          v61 = v36;
        }
        v36 = v61;
      }
      if (v36 != v37)
      {
        v65 = (uint64_t **)(v18 + 80);
        do
        {
          sub_1BE6B4B48((uint64_t)(v18 + 72), (uint64_t)(v36 + 32), (uint64_t)&v86);
          v66 = v86;
          v67 = *v65;
          v68 = (uint64_t **)(v18 + 80);
          v69 = (uint64_t **)(v18 + 80);
          if (*v65)
          {
            do
            {
              while (1)
              {
                v68 = (uint64_t **)v67;
                v70 = (uint64_t *)v67[4];
                v71 = v67 + 5;
                if (v70 == v67 + 5)
                  break;
                v72 = (_QWORD *)v86[4];
                while (v72 != v86 + 5)
                {
                  v73 = v72[4];
                  v74 = v70[4];
                  if (v73 < v74)
                    break;
                  if (v74 >= v73)
                  {
                    v75 = (_QWORD *)v72[1];
                    v76 = v72;
                    if (v75)
                    {
                      do
                      {
                        v72 = v75;
                        v75 = (_QWORD *)*v75;
                      }
                      while (v75);
                    }
                    else
                    {
                      do
                      {
                        v72 = (_QWORD *)v76[2];
                        v55 = *v72 == (_QWORD)v76;
                        v76 = v72;
                      }
                      while (!v55);
                    }
                    v77 = (uint64_t *)v70[1];
                    if (v77)
                    {
                      do
                      {
                        v78 = v77;
                        v77 = (uint64_t *)*v77;
                      }
                      while (v77);
                    }
                    else
                    {
                      do
                      {
                        v78 = (uint64_t *)v70[2];
                        v55 = *v78 == (_QWORD)v70;
                        v70 = v78;
                      }
                      while (!v55);
                    }
                    v70 = v78;
                    if (v78 != v71)
                      continue;
                  }
                  goto LABEL_75;
                }
                v67 = *v68;
                v69 = v68;
                if (!*v68)
                  goto LABEL_96;
              }
LABEL_75:
              v67 = v68[1];
            }
            while (v67);
            v69 = v68 + 1;
          }
LABEL_96:
          *v86 = 0;
          v66[1] = 0;
          v66[2] = (uint64_t)v68;
          *v69 = v66;
          v79 = (_QWORD *)**v35;
          if (v79)
          {
            *v35 = v79;
            v66 = *v69;
          }
          sub_1BE61F5C0(*((uint64_t **)v18 + 10), v66);
          ++*((_QWORD *)v18 + 11);
          v80 = (char *)*((_QWORD *)v36 + 1);
          if (v80)
          {
            do
            {
              v81 = v80;
              v80 = *(char **)v80;
            }
            while (v80);
          }
          else
          {
            do
            {
              v81 = (char *)*((_QWORD *)v36 + 2);
              v55 = *(_QWORD *)v81 == (_QWORD)v36;
              v36 = v81;
            }
            while (!v55);
          }
          v36 = v81;
        }
        while (v81 != v37);
      }
    }
  }

  return (CHStrokeGroupingResult *)v18;
}

- (id)groupingResultUpdatedWithGroupReplacements:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  CHStrokeGroupingResult *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  void *v73;
  void *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  CHStrokeGroupingResult *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  CHStrokeGroupingResult *v130;
  void *v131;
  id v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v132 = a3;
  if (objc_msgSend_count(v132, v4, v5, v6, v7, v8))
  {
    objc_msgSend_strokeGroups(self, v9, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend_mutableCopy(v14, v15, v16, v17, v18, v19);

    objc_msgSend_createdStrokeGroups(self, v21, v22, v23, v24, v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend_createdStrokeGroups(self, v26, v27, v28, v29, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend_mutableCopy(v32, v33, v34, v35, v36, v37);

    }
    else
    {
      objc_msgSend_set(MEMORY[0x1E0C99E20], v26, v27, v28, v29, v30);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v130 = self;
    objc_msgSend_deletedStrokeGroups(self, v40, v41, v42, v43, v44);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend_deletedStrokeGroups(self, v45, v46, v47, v48, v49);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = (void *)objc_msgSend_mutableCopy(v51, v52, v53, v54, v55, v56);

    }
    else
    {
      objc_msgSend_set(MEMORY[0x1E0C99E20], v45, v46, v47, v48, v49);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    objc_msgSend_strokeGroups(self, v57, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v133, (uint64_t)v137, 16, v64);
    if (v70)
    {
      v71 = *(_QWORD *)v134;
      do
      {
        for (i = 0; i != v70; ++i)
        {
          if (*(_QWORD *)v134 != v71)
            objc_enumerationMutation(v62);
          v73 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * i);
          v74 = (void *)MEMORY[0x1E0CB37E8];
          v75 = objc_msgSend_uniqueIdentifier(v73, v65, v66, v67, v68, v69);
          objc_msgSend_numberWithInteger_(v74, v76, v75, v77, v78, v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v132, v81, (uint64_t)v80, v82, v83, v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_strategyIdentifier(v73, v86, v87, v88, v89, v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = objc_msgSend_classification(v73, v92, v93, v94, v95, v96);
          objc_msgSend_updateStrategyIdentifier_classification_(v85, v98, (uint64_t)v91, v97, v99, v100);

          if (v85)
          {
            objc_msgSend_removeObject_(v20, v101, (uint64_t)v73, v102, v103, v104);
            objc_msgSend_addObject_(v20, v105, (uint64_t)v85, v106, v107, v108);
            if (objc_msgSend_containsObject_(v38, v109, (uint64_t)v73, v110, v111, v112))
            {
              objc_msgSend_removeObject_(v38, v113, (uint64_t)v73, v114, v115, v116);
              objc_msgSend_addObject_(v38, v117, (uint64_t)v85, v118, v119, v120);
            }
            else
            {
              objc_msgSend_addObject_(v131, v113, (uint64_t)v73, v114, v115, v116);
            }
          }

        }
        v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v65, (uint64_t)&v133, (uint64_t)v137, 16, v69);
      }
      while (v70);
    }

    v121 = [CHStrokeGroupingResult alloc];
    v127 = objc_msgSend_cachedAdjacencies(v130, v122, v123, v124, v125, v126);
    v39 = (CHStrokeGroupingResult *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_cachedAdjacencies_(v121, v128, (uint64_t)v20, (uint64_t)v38, (uint64_t)v131, v127);

  }
  else
  {
    v39 = self;
  }

  return v39;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)CHStrokeGroupingResult;
  -[CHStrokeGroupingResult description](&v46, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroups(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_count(v9, v10, v11, v12, v13, v14);
  objc_msgSend_createdStrokeGroups(self, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_count(v21, v22, v23, v24, v25, v26);
  objc_msgSend_deletedStrokeGroups(self, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_count(v33, v34, v35, v36, v37, v38);
  objc_msgSend_stringByAppendingFormat_(v3, v40, (uint64_t)CFSTR(" Groups: %ld, created: %ld, deleted: %ld"), v41, v42, v43, v15, v27, v39);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

- (id)strokeGroupsSortedBy:(unint64_t)a3 textGroupsOnly:(BOOL)a4
{
  _BOOL8 v4;
  CHStrokeGroupingResult *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *strokeGroupsSortedTopBottomLeftRight;
  void **p_strokeGroupsSortedTopBottomLeftRight;
  uint64_t v16;
  void *v17;

  v4 = a4;
  v6 = self;
  objc_sync_enter(v6);
  switch(a3)
  {
    case 0uLL:
      objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v6, v7, 3, v4, v10, v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 1uLL:
      if (!v4)
      {
        sub_1BE6C13F0(v6, 0, v8, v9, v10, v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      p_strokeGroupsSortedTopBottomLeftRight = (void **)&v6->_strokeGroupsSortedTopBottomLeftRight;
      strokeGroupsSortedTopBottomLeftRight = v6->_strokeGroupsSortedTopBottomLeftRight;
      if (strokeGroupsSortedTopBottomLeftRight)
        goto LABEL_19;
      sub_1BE6C13F0(v6, (const char *)1, v8, v9, v10, v11);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 2uLL:
      if (v4)
      {
        p_strokeGroupsSortedTopBottomLeftRight = (void **)&v6->_textStrokeGroupsSortedByWritingOrientation;
        strokeGroupsSortedTopBottomLeftRight = v6->_textStrokeGroupsSortedByWritingOrientation;
        if (strokeGroupsSortedTopBottomLeftRight)
          goto LABEL_19;
        sub_1BE6C1648(v6, (const char *)1, v8, v9, v10, v11);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        p_strokeGroupsSortedTopBottomLeftRight = (void **)&v6->_strokeGroupsSortedByWritingOrientation;
        strokeGroupsSortedTopBottomLeftRight = v6->_strokeGroupsSortedByWritingOrientation;
        if (strokeGroupsSortedTopBottomLeftRight)
          goto LABEL_19;
        sub_1BE6C1648(v6, 0, v8, v9, v10, v11);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_18;
    case 3uLL:
      if (v4)
      {
        p_strokeGroupsSortedTopBottomLeftRight = (void **)&v6->_textStrokeGroupsSortedByCTLD;
        strokeGroupsSortedTopBottomLeftRight = v6->_textStrokeGroupsSortedByCTLD;
        if (strokeGroupsSortedTopBottomLeftRight)
          goto LABEL_19;
        sub_1BE6C1D04(v6, 1);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        p_strokeGroupsSortedTopBottomLeftRight = (void **)&v6->_strokeGroupsSortedByCTLD;
        strokeGroupsSortedTopBottomLeftRight = v6->_strokeGroupsSortedByCTLD;
        if (strokeGroupsSortedTopBottomLeftRight)
          goto LABEL_19;
        sub_1BE6C1D04(v6, 0);
        v16 = objc_claimAutoreleasedReturnValue();
      }
LABEL_18:
      v17 = *p_strokeGroupsSortedTopBottomLeftRight;
      *p_strokeGroupsSortedTopBottomLeftRight = (void *)v16;

      strokeGroupsSortedTopBottomLeftRight = *p_strokeGroupsSortedTopBottomLeftRight;
LABEL_19:
      v12 = strokeGroupsSortedTopBottomLeftRight;
LABEL_20:
      v13 = v12;
LABEL_21:
      objc_sync_exit(v6);

      return v13;
    default:
      v13 = 0;
      goto LABEL_21;
  }
}

- (NSArray)strokeGroupClusters
{
  CHStrokeGroupingResult *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *strokeGroupClusters;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_strokeGroupClusters)
  {
    v3 = (void *)objc_opt_class();
    objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v2, v4, 0, 0, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeGroupsClusteredByProximity_(v3, v8, (uint64_t)v7, v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    strokeGroupClusters = v2->_strokeGroupClusters;
    v2->_strokeGroupClusters = (NSArray *)v12;

  }
  objc_sync_exit(v2);

  return v2->_strokeGroupClusters;
}

- (NSArray)textStrokeGroupClusters
{
  CHStrokeGroupingResult *v2;
  CHCTLD *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  NSArray *textStrokeGroupClusters;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_textStrokeGroupClusters)
  {
    v3 = objc_alloc_init(CHCTLD);
    objc_msgSend_textStrokeGroups(v2, v4, v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allObjects(v9, v10, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_strokeGroupRegions_(v3, v16, (uint64_t)v15, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v21, v22, v23, v24, v25);
    v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v27 = v20;
    v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v48, (uint64_t)v52, 16, v29);
    if (v30)
    {
      v31 = *(_QWORD *)v49;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v49 != v31)
            objc_enumerationMutation(v27);
          v33 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v32);
          v34 = (void *)objc_opt_class();
          objc_msgSend_strokeGroupsClusteredByProximity_(v34, v35, v33, v36, v37, v38, (_QWORD)v48);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v26, v40, (uint64_t)v39, v41, v42, v43);

          ++v32;
        }
        while (v30 != v32);
        v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v44, (uint64_t)&v48, (uint64_t)v52, 16, v45);
      }
      while (v30);
    }

    textStrokeGroupClusters = v2->_textStrokeGroupClusters;
    v2->_textStrokeGroupClusters = v26;

  }
  objc_sync_exit(v2);

  return v2->_textStrokeGroupClusters;
}

- (id)textStrokeGroupClustersAtPosition:(CGPoint)a3 closestAbove:(id *)a4 closestBelow:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  double y;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  CGFloat *v20;
  double v21;
  uint64_t i;
  void *v23;
  CGFloat x;
  CGFloat v25;
  CGFloat width;
  CGFloat height;
  id v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double MaxY;
  const char *v48;
  uint64_t v49;
  double MinY;
  id v52;
  double v53;
  id v55;
  id v56;
  void *v60;
  id v61;
  id obj;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  y = a3.y;
  v73 = *MEMORY[0x1E0C80C00];
  objc_msgSend_textStrokeGroupClusters(self, a2, (uint64_t)a4, (uint64_t)a5, v5, v6, a3.x);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10, v11, v12);
  v61 = (id)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v60;
  v15 = 0;
  v16 = 0;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v67, (uint64_t)v72, 16, v14);
  if (v17)
  {
    v18 = *(_QWORD *)v68;
    v19 = 1.79769313e308;
    v20 = (CGFloat *)MEMORY[0x1E0C9D628];
    v21 = 1.79769313e308;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v68 != v18)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        x = *v20;
        v25 = v20[1];
        width = v20[2];
        height = v20[3];
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v28 = v23;
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v63, (uint64_t)v71, 16, v30);
        if (v36)
        {
          v37 = *(_QWORD *)v64;
          do
          {
            for (j = 0; j != v36; ++j)
            {
              if (*(_QWORD *)v64 != v37)
                objc_enumerationMutation(v28);
              objc_msgSend_bounds(*(void **)(*((_QWORD *)&v63 + 1) + 8 * j), v31, v32, v33, v34, v35);
              v80.origin.x = v39;
              v80.origin.y = v40;
              v80.size.width = v41;
              v80.size.height = v42;
              v74.origin.x = x;
              v74.origin.y = v25;
              v74.size.width = width;
              v74.size.height = height;
              v75 = CGRectUnion(v74, v80);
              x = v75.origin.x;
              v25 = v75.origin.y;
              width = v75.size.width;
              height = v75.size.height;
            }
            v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v63, (uint64_t)v71, 16, v35);
          }
          while (v36);
        }

        v76.origin.x = x;
        v76.origin.y = v25;
        v76.size.width = width;
        v76.size.height = height;
        if (CGRectGetMinY(v76) <= y)
        {
          v77.origin.x = x;
          v77.origin.y = v25;
          v77.size.width = width;
          v77.size.height = height;
          if (CGRectGetMaxY(v77) >= y)
            objc_msgSend_addObject_(v61, v43, (uint64_t)v28, v44, v45, v46);
        }
        v78.origin.x = x;
        v78.origin.y = v25;
        v78.size.width = width;
        v78.size.height = height;
        MaxY = CGRectGetMaxY(v78);
        v79.origin.x = x;
        v79.origin.y = v25;
        v79.size.width = width;
        v79.size.height = height;
        MinY = CGRectGetMinY(v79);
        if (y - MaxY > 0.0 && y - MaxY < v21)
        {
          v52 = v28;

          v16 = v52;
          v21 = y - MaxY;
        }
        v53 = MinY - y;
        if (v53 > 0.0 && v53 < v19)
        {
          v55 = v28;

          v15 = v55;
          v19 = v53;
        }
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v48, (uint64_t)&v67, (uint64_t)v72, 16, v49);
    }
    while (v17);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v16);
  if (a5)
    *a5 = objc_retainAutorelease(v15);
  v56 = v61;

  return v56;
}

- (NSSet)textStrokeGroups
{
  CHStrokeGroupingResult *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *textStrokeGroups;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_textStrokeGroups)
  {
    objc_msgSend_strokeGroups(v2, v3, v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectsPassingTest_(v8, v9, (uint64_t)&unk_1E77F33F0, v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    textStrokeGroups = v2->_textStrokeGroups;
    v2->_textStrokeGroups = (NSSet *)v13;

  }
  objc_sync_exit(v2);

  return v2->_textStrokeGroups;
}

- (const)cachedAdjacencies
{
  return &self->_cachedAdjacencies;
}

+ (id)expandedStrokeGroupClusters:(id)a3 allClusters:(id)a4
{
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  double x;
  double v60;
  double y;
  double v62;
  double width;
  id v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  double v75;
  uint64_t j;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  double v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  double v89;
  double v90;
  double v91;
  double MinY;
  double MaxY;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  double v118;
  double v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  id v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t k;
  id v159;
  void *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  double v168;
  double v169;
  double v170;
  double v171;
  CGFloat v172;
  double v173;
  CGFloat v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  double v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  double v207;
  double v208;
  double v209;
  CGFloat v210;
  double v211;
  CGFloat v212;
  double v213;
  CGFloat v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  double v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  double v236;
  CGFloat v237;
  double v238;
  double v239;
  double v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  id v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  double v289;
  CGFloat v290;
  double v291;
  CGFloat v292;
  double v293;
  CGFloat v294;
  double v295;
  CGFloat v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  double v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  void *v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  double v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  void *v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  void *v329;
  void *v330;
  void *v331;
  double v332;
  double v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  void *v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  double v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  void *v349;
  const char *v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  double v355;
  double v356;
  CGFloat v357;
  CGFloat v358;
  double v359;
  double v360;
  double v361;
  double v362;
  void *v363;
  const char *v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  const char *v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  const char *v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  void *v380;
  CGFloat v381;
  CGFloat v382;
  CGFloat v383;
  CGFloat height;
  id v385;
  const char *v386;
  uint64_t v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t m;
  void *v395;
  const char *v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  double v401;
  CGFloat v402;
  double v403;
  CGFloat v404;
  double v405;
  CGFloat v406;
  double v407;
  CGFloat v408;
  const char *v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  const char *v414;
  uint64_t v415;
  uint64_t v416;
  const char *v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  char v422;
  uint64_t v423;
  void *v424;
  const char *v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  void *v430;
  const char *v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  char isEqual;
  void *v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  double v442;
  CGFloat v443;
  double v444;
  CGFloat v445;
  double v446;
  double v447;
  double v448;
  double v449;
  double v451;
  double v452;
  double v453;
  void *v454;
  double v455;
  double v456;
  double v457;
  double v458;
  id v459;
  id v460;
  id v461;
  double MaxX;
  id v463;
  id v464;
  id obj;
  CGFloat objb;
  id objc;
  id obja;
  void *v469;
  id v470;
  void *v471;
  double rect;
  CGFloat rectb;
  void *recta;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  __int128 v481;
  __int128 v482;
  __int128 v483;
  __int128 v484;
  __int128 v485;
  __int128 v486;
  __int128 v487;
  __int128 v488;
  __int128 v489;
  __int128 v490;
  __int128 v491;
  __int128 v492;
  __int128 v493;
  __int128 v494;
  _BYTE v495[128];
  _BYTE v496[128];
  _BYTE v497[128];
  _BYTE v498[128];
  _BYTE v499[128];
  uint64_t v500;
  CGRect v501;
  CGRect v502;
  CGRect v503;
  CGRect v504;
  CGRect v505;
  CGRect v506;
  CGRect v507;
  CGRect v508;
  CGRect v509;
  CGRect v510;
  CGRect v511;
  CGRect v512;
  CGRect v513;
  CGRect v514;
  CGRect v515;
  CGRect v516;
  CGRect v517;
  CGRect v518;
  CGRect v519;

  v500 = *MEMORY[0x1E0C80C00];
  v470 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v12 = objc_msgSend_count(v5, v7, v8, v9, v10, v11, v5);
  objc_msgSend_dictionaryWithCapacity_(v6, v13, v12, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0C99E08];
  v24 = objc_msgSend_count(v5, v19, v20, v21, v22, v23);
  objc_msgSend_dictionaryWithCapacity_(v18, v25, v24, v26, v27, v28);
  v469 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0C99E08];
  v35 = objc_msgSend_count(v5, v30, v31, v32, v33, v34);
  objc_msgSend_dictionaryWithCapacity_(v29, v36, v35, v37, v38, v39);
  v471 = (void *)objc_claimAutoreleasedReturnValue();
  v493 = 0u;
  v494 = 0u;
  v491 = 0u;
  v492 = 0u;
  obj = v5;
  v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v491, (uint64_t)v499, 16, v41);
  if (v47)
  {
    v48 = *(_QWORD *)v492;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v492 != v48)
          objc_enumerationMutation(obj);
        v50 = *(void **)(*((_QWORD *)&v491 + 1) + 8 * i);
        objc_msgSend_firstObject(v50, v42, v43, v44, v45, v46);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_bounds(v51, v52, v53, v54, v55, v56);
        rect = v57;
        x = v58;
        y = v60;
        width = v62;

        v489 = 0u;
        v490 = 0u;
        v487 = 0u;
        v488 = 0u;
        v64 = v50;
        v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v487, (uint64_t)v498, 16, v66);
        if (v72)
        {
          v73 = *(_QWORD *)v488;
          v74 = 0.0;
          v75 = 0.0;
          do
          {
            for (j = 0; j != v72; ++j)
            {
              if (*(_QWORD *)v488 != v73)
                objc_enumerationMutation(v64);
              v77 = *(void **)(*((_QWORD *)&v487 + 1) + 8 * j);
              objc_msgSend_normalizedSize(v77, v67, v68, v69, v70, v71);
              if (v83 <= 0.0)
              {
                objc_msgSend_bounds(v77, v78, v79, v80, v81, v82);
                v90 = v91;
              }
              else
              {
                objc_msgSend_normalizedSize(v77, v78, v79, v80, v81, v82);
                v90 = v89;
              }
              objc_msgSend_bounds(v77, v84, v85, v86, v87, v88);
              MinY = CGRectGetMinY(v501);
              v502.origin.x = x;
              v502.origin.y = y;
              v502.size.width = width;
              v502.size.height = rect;
              MaxY = CGRectGetMaxY(v502);
              objc_msgSend_bounds(v77, v94, v95, v96, v97, v98);
              v517.origin.x = v99;
              v517.origin.y = v100;
              v517.size.width = v101;
              v517.size.height = v102;
              v503.origin.x = x;
              v503.origin.y = y;
              v503.size.width = width;
              v503.size.height = rect;
              v504 = CGRectUnion(v503, v517);
              rect = v504.size.height;
              x = v504.origin.x;
              y = v504.origin.y;
              width = v504.size.width;
              v75 = v75 + v90;
              v74 = v74 + fmax(MinY - MaxY, 0.0);
            }
            v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v67, (uint64_t)&v487, (uint64_t)v498, 16, v71);
          }
          while (v72);
        }
        else
        {
          v74 = 0.0;
          v75 = 0.0;
        }

        v118 = v75 / (double)(unint64_t)objc_msgSend_count(v64, v103, v104, v105, v106, v107);
        if ((unint64_t)objc_msgSend_count(v64, v108, v109, v110, v111, v112) < 2)
          v119 = v118 / 3.0;
        else
          v119 = v74 / (double)(unint64_t)(objc_msgSend_count(v64, v113, v114, v115, v116, v117) - 1);
        objc_msgSend_ch_valueWithCGRect_(MEMORY[0x1E0CB3B18], v113, v114, v115, v116, v117, x, y, width, rect);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v17, v121, (uint64_t)v120, (uint64_t)v64, v122, v123);

        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v124, v125, v126, v127, v128, v118);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v469, v130, (uint64_t)v129, (uint64_t)v64, v131, v132);

        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v133, v134, v135, v136, v137, v119);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v471, v139, (uint64_t)v138, (uint64_t)v64, v140, v141);

      }
      v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v42, (uint64_t)&v491, (uint64_t)v499, 16, v46);
    }
    while (v47);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v142, v143, v144, v145, v146);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v485 = 0u;
  v486 = 0u;
  v483 = 0u;
  v484 = 0u;
  v148 = obj;
  v151 = 0;
  v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v148, v149, (uint64_t)&v483, (uint64_t)v497, 16, v150);
  if (v156)
  {
    v157 = *(_QWORD *)v484;
    do
    {
      for (k = 0; k != v156; ++k)
      {
        if (*(_QWORD *)v484 != v157)
          objc_enumerationMutation(v148);
        v160 = *(void **)(*((_QWORD *)&v483 + 1) + 8 * k);
        if (objc_msgSend_containsObject_(v470, v152, (uint64_t)v160, v153, v154, v155))
          goto LABEL_26;
        if (objc_msgSend_count(v147, v152, v161, v153, v154, v155))
        {
          objc_msgSend_objectForKeyedSubscript_(v17, v152, (uint64_t)v151, v153, v154, v155);
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ch_CGRectValue(v162, v163, v164, v165, v166, v167);
          rectb = v168;
          v170 = v169;
          v172 = v171;
          v174 = v173;

          objc_msgSend_objectForKeyedSubscript_(v469, v175, (uint64_t)v151, v176, v177, v178);
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_doubleValue(v179, v180, v181, v182, v183, v184);
          v459 = v185;

          objc_msgSend_objectForKeyedSubscript_(v471, v186, (uint64_t)v151, v187, v188, v189);
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_doubleValue(v190, v191, v192, v193, v194, v195);
          v457 = v196;

          objc_msgSend_objectForKeyedSubscript_(v17, v197, (uint64_t)v160, v198, v199, v200);
          v201 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ch_CGRectValue(v201, v202, v203, v204, v205, v206);
          v208 = v207;
          v210 = v209;
          v212 = v211;
          v214 = v213;

          objc_msgSend_objectForKeyedSubscript_(v469, v215, (uint64_t)v160, v216, v217, v218);
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_doubleValue(v219, v220, v221, v222, v223, v224);
          v455 = v225;

          objc_msgSend_objectForKeyedSubscript_(v471, v226, (uint64_t)v160, v227, v228, v229);
          v230 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_doubleValue(v230, v231, v232, v233, v234, v235);
          v452 = v236;

          v505.origin.x = v170;
          v505.origin.y = rectb;
          objb = v172;
          v505.size.width = v172;
          v237 = v174;
          v505.size.height = v174;
          MaxX = CGRectGetMaxX(v505);
          v506.origin.x = v208;
          v506.origin.y = v210;
          v506.size.width = v212;
          v506.size.height = v214;
          v238 = CGRectGetMaxX(v506);
          v507.origin.x = v208;
          v507.origin.y = v210;
          v507.size.width = v212;
          v507.size.height = v214;
          v239 = CGRectGetMinY(v507);
          v508.origin.x = v170;
          v508.origin.y = rectb;
          v508.size.width = objb;
          v508.size.height = v237;
          v240 = CGRectGetMaxY(v508);
          if (fmin(MaxX, v238) - fmax(v170, v208) > 0.0 && v239 - v240 < (v457 + *(double *)&v459 + v455 + v452) * 0.5)
          {
LABEL_26:
            objc_msgSend_addObject_(v147, v152, (uint64_t)v160, v153, v154, v155);
            v159 = v160;

            v151 = v159;
          }
        }
      }
      v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v148, v152, (uint64_t)&v483, (uint64_t)v497, 16, v155);
    }
    while (v156);
  }

  v246 = objc_msgSend_count(v147, v241, v242, v243, v244, v245);
  if (v246 != objc_msgSend_count(v148, v247, v248, v249, v250, v251))
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v252, v253, v254, v255, v256);
    recta = (void *)objc_claimAutoreleasedReturnValue();
    v267 = objc_msgSend_count(v148, v257, v258, v259, v260, v261);
    if (v267 - 1 >= 0)
    {
      do
      {
        objc_msgSend_objectAtIndexedSubscript_(v148, v262, --v267, v264, v265, v266);
        v268 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_containsObject_(v147, v269, (uint64_t)v268, v270, v271, v272))
          goto LABEL_40;
        if (objc_msgSend_count(recta, v273, v274, v275, v276, v277))
        {
          objc_msgSend_objectForKeyedSubscript_(v17, v279, (uint64_t)v151, v280, v281, v282);
          v283 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ch_CGRectValue(v283, v284, v285, v286, v287, v288);
          v290 = v289;
          v292 = v291;
          v294 = v293;
          v296 = v295;

          objc_msgSend_objectForKeyedSubscript_(v469, v297, (uint64_t)v151, v298, v299, v300);
          v301 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_doubleValue(v301, v302, v303, v304, v305, v306);
          v458 = v307;

          objc_msgSend_objectForKeyedSubscript_(v471, v308, (uint64_t)v151, v309, v310, v311);
          v312 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_doubleValue(v312, v313, v314, v315, v316, v317);
          v456 = v318;

          objc_msgSend_objectForKeyedSubscript_(v17, v319, (uint64_t)v268, v320, v321, v322);
          v323 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ch_CGRectValue(v323, v324, v325, v326, v327, v328);
          v464 = v330;
          objc = v329;
          v460 = v331;
          v333 = v332;

          objc_msgSend_objectForKeyedSubscript_(v469, v334, (uint64_t)v268, v335, v336, v337);
          v338 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_doubleValue(v338, v339, v340, v341, v342, v343);
          v453 = v344;

          objc_msgSend_objectForKeyedSubscript_(v471, v345, (uint64_t)v268, v346, v347, v348);
          v349 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_doubleValue(v349, v350, v351, v352, v353, v354);
          v451 = v355;

          v356 = v290;
          v509.origin.x = v290;
          v509.origin.y = v292;
          v357 = v294;
          v509.size.width = v294;
          v358 = v296;
          v509.size.height = v296;
          v359 = CGRectGetMaxX(v509);
          v510.origin.x = v333;
          *(_QWORD *)&v510.size.width = v464;
          *(_QWORD *)&v510.origin.y = objc;
          *(_QWORD *)&v510.size.height = v460;
          v360 = CGRectGetMaxX(v510);
          v511.origin.x = v356;
          v511.origin.y = v292;
          v511.size.width = v357;
          v511.size.height = v358;
          v361 = CGRectGetMinY(v511);
          v512.origin.x = v333;
          *(_QWORD *)&v512.size.width = v464;
          *(_QWORD *)&v512.origin.y = objc;
          *(_QWORD *)&v512.size.height = v460;
          v362 = CGRectGetMaxY(v512);
          if (fmin(v359, v360) - fmax(v356, v333) > 0.0 && v361 - v362 < (v456 + v458 + v453 + v451) * 0.5)
          {
LABEL_40:
            objc_msgSend_addObject_(recta, v273, (uint64_t)v268, v275, v276, v277);
            v278 = v268;

            v151 = v278;
          }
        }

      }
      while (v267 > 0);
    }
    objc_msgSend_reverseObjectEnumerator(recta, v262, v263, v264, v265, v266);
    v363 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allObjects(v363, v364, v365, v366, v367, v368);
    v454 = (void *)objc_claimAutoreleasedReturnValue();

    v374 = objc_msgSend_count(v454, v369, v370, v371, v372, v373);
    if (v374 == objc_msgSend_count(v148, v375, v376, v377, v378, v379))
    {
      v380 = v454;
      v463 = v454;
LABEL_69:

      goto LABEL_70;
    }
    v381 = *MEMORY[0x1E0C9D628];
    v382 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v383 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v479 = 0u;
    v480 = 0u;
    v481 = 0u;
    v482 = 0u;
    v385 = v454;
    v392 = objc_msgSend_countByEnumeratingWithState_objects_count_(v385, v386, (uint64_t)&v479, (uint64_t)v496, 16, v387);
    if (v392)
    {
      v393 = *(_QWORD *)v480;
      do
      {
        for (m = 0; m != v392; ++m)
        {
          if (*(_QWORD *)v480 != v393)
            objc_enumerationMutation(v385);
          objc_msgSend_objectForKeyedSubscript_(v17, v388, *(_QWORD *)(*((_QWORD *)&v479 + 1) + 8 * m), v389, v390, v391);
          v395 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_ch_CGRectValue(v395, v396, v397, v398, v399, v400);
          v402 = v401;
          v404 = v403;
          v406 = v405;
          v408 = v407;

          v513.origin.x = v381;
          v513.origin.y = v382;
          v513.size.width = v383;
          v513.size.height = height;
          v518.origin.x = v402;
          v518.origin.y = v404;
          v518.size.width = v406;
          v518.size.height = v408;
          v514 = CGRectUnion(v513, v518);
          v381 = v514.origin.x;
          v382 = v514.origin.y;
          v383 = v514.size.width;
          height = v514.size.height;
        }
        v392 = objc_msgSend_countByEnumeratingWithState_objects_count_(v385, v388, (uint64_t)&v479, (uint64_t)v496, 16, v391);
      }
      while (v392);
    }

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v409, v410, v411, v412, v413);
    v463 = (id)objc_claimAutoreleasedReturnValue();
    v477 = 0u;
    v478 = 0u;
    v475 = 0u;
    v476 = 0u;
    v461 = v148;
    v416 = objc_msgSend_countByEnumeratingWithState_objects_count_(v461, v414, (uint64_t)&v475, (uint64_t)v495, 16, v415);
    if (!v416)
    {
LABEL_68:

      v380 = v454;
      goto LABEL_69;
    }
    v421 = v416;
    v422 = 0;
    obja = *(id *)v476;
LABEL_56:
    v423 = 0;
    while (1)
    {
      if (*(id *)v476 != obja)
        objc_enumerationMutation(v461);
      v424 = *(void **)(*((_QWORD *)&v475 + 1) + 8 * v423);
      if (objc_msgSend_containsObject_(v385, v417, (uint64_t)v424, v418, v419, v420))
        break;
      if ((v422 & 1) != 0)
      {
        objc_msgSend_objectForKeyedSubscript_(v17, v417, (uint64_t)v424, v418, v419, v420);
        v436 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ch_CGRectValue(v436, v437, v438, v439, v440, v441);
        v443 = v442;
        v445 = v444;
        v447 = v446;
        v449 = v448;

        v515.origin.x = v381;
        v515.origin.y = v382;
        v515.size.width = v383;
        v515.size.height = height;
        v519.origin.x = v443;
        v519.origin.y = v445;
        v519.size.width = v447;
        v519.size.height = v449;
        v516 = CGRectIntersection(v515, v519);
        if (v516.size.width * v516.size.height / (v447 * v449 + 1.0e-10) > 0.65)
          objc_msgSend_addObject_(v463, v417, (uint64_t)v424, v418, v419, v420);
LABEL_66:
        v422 = 1;
        if (v421 == ++v423)
        {
LABEL_67:
          v421 = objc_msgSend_countByEnumeratingWithState_objects_count_(v461, v417, (uint64_t)&v475, (uint64_t)v495, 16, v420);
          if (!v421)
            goto LABEL_68;
          goto LABEL_56;
        }
      }
      else
      {
        v422 = 0;
        if (v421 == ++v423)
          goto LABEL_67;
      }
    }
    objc_msgSend_addObject_(v463, v417, (uint64_t)v424, v418, v419, v420);
    objc_msgSend_lastObject(v385, v425, v426, v427, v428, v429);
    v430 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v424, v431, (uint64_t)v430, v432, v433, v434);

    if ((isEqual & 1) != 0)
      goto LABEL_68;
    goto LABEL_66;
  }
  v463 = v147;
LABEL_70:

  return v463;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_strokeGroups, (uint64_t)CFSTR("strokeGroups"), v3, v4);
}

- (CHStrokeGroupingResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  CHStrokeGroupingResult *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)&v23, 3, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v10, (uint64_t)v9, v11, v12, v13, v23, v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("strokeGroups"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (CHStrokeGroupingResult *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_(self, v19, (uint64_t)v18, (uint64_t)v18, 0, v20);
  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CHStrokeGroupingResult *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CHStrokeGroupingResult *v11;
  NSSet *strokeGroups;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSSet *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int isEqual;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSSet *createdStrokeGroups;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSSet *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSSet *deletedStrokeGroups;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (CHStrokeGroupingResult *)v4;
    v11 = v5;
    if (self)
    {
      if (self != v5)
      {
        strokeGroups = self->_strokeGroups;
        objc_msgSend_strokeGroups(v5, v6, v7, v8, v9, v10);
        v18 = (NSSet *)objc_claimAutoreleasedReturnValue();
        if (strokeGroups == v18)
        {

        }
        else
        {
          objc_msgSend_strokeGroups(v11, v13, v14, v15, v16, v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v19, v20, (uint64_t)self->_strokeGroups, v21, v22, v23);

          if (!isEqual)
            goto LABEL_13;
        }
        createdStrokeGroups = self->_createdStrokeGroups;
        objc_msgSend_createdStrokeGroups(v11, v25, v26, v27, v28, v29);
        v36 = (NSSet *)objc_claimAutoreleasedReturnValue();
        if (createdStrokeGroups == v36)
        {

        }
        else
        {
          if (!self->_createdStrokeGroups)
            goto LABEL_18;
          objc_msgSend_createdStrokeGroups(v11, v31, v32, v33, v34, v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend_isEqual_(v37, v38, (uint64_t)self->_createdStrokeGroups, v39, v40, v41);

          if (!v42)
          {
LABEL_13:
            LOBYTE(self) = 0;
            goto LABEL_21;
          }
        }
        deletedStrokeGroups = self->_deletedStrokeGroups;
        objc_msgSend_deletedStrokeGroups(v11, v43, v44, v45, v46, v47);
        v36 = (NSSet *)objc_claimAutoreleasedReturnValue();
        if (deletedStrokeGroups == v36)
        {
          LOBYTE(self) = 1;
          v36 = deletedStrokeGroups;
          goto LABEL_20;
        }
        if (self->_deletedStrokeGroups)
        {
          objc_msgSend_deletedStrokeGroups(v11, v49, v50, v51, v52, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(self) = objc_msgSend_isEqual_(v54, v55, (uint64_t)self->_deletedStrokeGroups, v56, v57, v58);

LABEL_20:
          goto LABEL_21;
        }
LABEL_18:
        LOBYTE(self) = 0;
        goto LABEL_20;
      }
      LOBYTE(self) = 1;
    }
LABEL_21:

    goto LABEL_22;
  }
  LOBYTE(self) = 0;
LABEL_22:

  return (char)self;
}

- (NSSet)strokeGroups
{
  return self->_strokeGroups;
}

- (NSSet)createdStrokeGroups
{
  return self->_createdStrokeGroups;
}

- (NSSet)deletedStrokeGroups
{
  return self->_deletedStrokeGroups;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedStrokeGroups, 0);
  objc_storeStrong((id *)&self->_createdStrokeGroups, 0);
  objc_storeStrong((id *)&self->_strokeGroups, 0);
  sub_1BE6B4610((uint64_t)&self->_cachedAdjacencies, (_QWORD *)self->_cachedAdjacencies.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_textStrokeGroups, 0);
  objc_storeStrong((id *)&self->_strokeGroupClusters, 0);
  objc_storeStrong((id *)&self->_textStrokeGroupClusters, 0);
  objc_storeStrong((id *)&self->_strokeGroupsSortedByCTLD, 0);
  objc_storeStrong((id *)&self->_textStrokeGroupsSortedByCTLD, 0);
  objc_storeStrong((id *)&self->_strokeGroupsSortedByWritingOrientation, 0);
  objc_storeStrong((id *)&self->_textStrokeGroupsSortedByWritingOrientation, 0);
  objc_storeStrong((id *)&self->_strokeGroupsSortedTopBottomLeftRight, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 9) = (char *)self + 80;
  return self;
}

@end
