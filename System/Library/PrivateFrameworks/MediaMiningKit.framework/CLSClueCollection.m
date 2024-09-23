@implementation CLSClueCollection

- (CLSClueCollection)initWithServiceManager:(id)a3
{
  id v4;
  CLSClueCollection *v5;
  CLSClueCollection *v6;
  void *v7;
  uint64_t v8;
  CLSInputPeopleClue *mePersonClue;
  uint64_t v10;
  NSMapTable *inputCluesByKey;
  uint64_t v12;
  NSMapTable *outputCluesByKey;
  uint64_t v14;
  NSMapTable *meaningCluesByKey;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CLSClueCollection;
  v5 = -[CLSClueCollection init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_versionCount = 1;
    v5->_recursiveLock = 0;
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setRelationship:", 14);
    +[CLSInputPeopleClue clueWithPeople:serviceManager:](CLSInputPeopleClue, "clueWithPeople:serviceManager:", v7, v4);
    v8 = objc_claimAutoreleasedReturnValue();
    mePersonClue = v6->_mePersonClue;
    v6->_mePersonClue = (CLSInputPeopleClue *)v8;

    -[CLSClue setKey:](v6->_mePersonClue, "setKey:", CFSTR("__ME_PERSON__INTERNAL__"));
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    inputCluesByKey = v6->_inputCluesByKey;
    v6->_inputCluesByKey = (NSMapTable *)v10;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    outputCluesByKey = v6->_outputCluesByKey;
    v6->_outputCluesByKey = (NSMapTable *)v12;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    meaningCluesByKey = v6->_meaningCluesByKey;
    v6->_meaningCluesByKey = (NSMapTable *)v14;

  }
  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CLSClueCollection *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  char *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char *v44;
  void *v45;
  void *k;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t n;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t ii;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  char *v74;
  void *v75;
  char *v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t jj;
  void *v83;
  void *v84;
  id v85;
  CLSClueCollection *v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  char *v93;
  id obj;
  char *obja;
  id objb;
  char *objc;
  id v98;
  char *v99;
  char *v100;
  id v101;
  char *v102;
  id v103;
  char *v104;
  id v105;
  char *v106;
  id v107;
  id v108;
  char *v109;
  id v110;
  id v111;
  id v112;
  char *v113;
  __int128 v114;
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
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _QWORD v162[4];
  id v163;
  _QWORD v164[4];
  id v165;
  _QWORD v166[4];
  id v167;
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  uint64_t v180;

  v180 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<ClueCollection>"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(CFSTR("<Input Clues>"), "cls_indentBy:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n%@"), v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[CLSClueCollection localDates](self, "localDates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("dates:[%@]"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cls_indentBy:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n%@"), v11);

  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = self;
  -[CLSClueCollection peopleNames](self, "peopleNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingSelector:", sel_compare_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("peoples:[%@]"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cls_indentBy:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n%@"), v19);

  v20 = MEMORY[0x1E0C809B0];
  v166[0] = MEMORY[0x1E0C809B0];
  v166[1] = 3221225472;
  v166[2] = __32__CLSClueCollection_description__block_invoke;
  v166[3] = &unk_1E84F8A48;
  v21 = v3;
  v167 = v21;
  -[CLSClueCollection enumerateTimeClues:](self, "enumerateTimeClues:", v166);
  v164[0] = v20;
  v164[1] = 3221225472;
  v164[2] = __32__CLSClueCollection_description__block_invoke_2;
  v164[3] = &unk_1E84F8A70;
  v22 = v21;
  v165 = v22;
  -[CLSClueCollection enumerateLocationClues:](self, "enumerateLocationClues:", v164);
  v162[0] = v20;
  v162[1] = 3221225472;
  v162[2] = __32__CLSClueCollection_description__block_invoke_3;
  v162[3] = &unk_1E84F8A98;
  v23 = v22;
  v163 = v23;
  -[CLSClueCollection enumeratePeopleClues:](self, "enumeratePeopleClues:", v162);
  objc_msgSend(CFSTR("<Output Clues>"), "cls_indentBy:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "appendFormat:", CFSTR("\n\n%@"), v24);

  v25 = (void *)objc_opt_new();
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  v161 = 0u;
  v87 = v13;
  -[NSMapTable objectEnumerator](v13->_outputCluesByKey, "objectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v102 = (char *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v158, v179, 16);
  if (v102)
  {
    v98 = *(id *)v159;
    do
    {
      v26 = 0;
      do
      {
        if (*(id *)v159 != v98)
          objc_enumerationMutation(obj);
        v106 = v26;
        v27 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * (_QWORD)v26);
        v154 = 0u;
        v155 = 0u;
        v156 = 0u;
        v157 = 0u;
        objc_msgSend(v27, "objectEnumerator");
        v110 = (id)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v154, v178, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v155;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v155 != v30)
                objc_enumerationMutation(v110);
              v32 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * i);
              v150 = 0u;
              v151 = 0u;
              v152 = 0u;
              v153 = 0u;
              v33 = v32;
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v150, v177, 16);
              if (v34)
              {
                v35 = v34;
                v36 = *(_QWORD *)v151;
                do
                {
                  for (j = 0; j != v35; ++j)
                  {
                    if (*(_QWORD *)v151 != v36)
                      objc_enumerationMutation(v33);
                    objc_msgSend(*(id *)(*((_QWORD *)&v150 + 1) + 8 * j), "stringValue");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "addObject:", v38);

                  }
                  v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v150, v177, 16);
                }
                while (v35);
              }

            }
            v29 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v154, v178, 16);
          }
          while (v29);
        }

        v26 = v106 + 1;
      }
      while (v106 + 1 != v102);
      v102 = (char *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v158, v179, 16);
    }
    while (v102);
  }

  v39 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v25, "sortedArrayUsingSelector:", sel_compare_);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "componentsJoinedByString:", CFSTR(", "));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringWithFormat:", CFSTR("values:[%@]"), v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "cls_indentBy:", 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "appendFormat:", CFSTR("\n%@"), v43);

  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  -[NSMapTable objectEnumerator](v87->_outputCluesByKey, "objectEnumerator");
  v89 = (id)objc_claimAutoreleasedReturnValue();
  obja = (char *)objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v146, v176, 16);
  if (obja)
  {
    v91 = *(id *)v147;
    do
    {
      v44 = 0;
      do
      {
        if (*(id *)v147 != v91)
          objc_enumerationMutation(v89);
        v99 = v44;
        v45 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * (_QWORD)v44);
        v142 = 0u;
        v143 = 0u;
        v144 = 0u;
        v145 = 0u;
        objc_msgSend(v45, "objectEnumerator");
        v103 = (id)objc_claimAutoreleasedReturnValue();
        v111 = (id)objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v142, v175, 16);
        if (v111)
        {
          v107 = *(id *)v143;
          do
          {
            for (k = 0; k != v111; k = (char *)k + 1)
            {
              if (*(id *)v143 != v107)
                objc_enumerationMutation(v103);
              v47 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * (_QWORD)k);
              v138 = 0u;
              v139 = 0u;
              v140 = 0u;
              v141 = 0u;
              v48 = v47;
              v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v138, v174, 16);
              if (v49)
              {
                v50 = v49;
                v51 = *(_QWORD *)v139;
                do
                {
                  for (m = 0; m != v50; ++m)
                  {
                    if (*(_QWORD *)v139 != v51)
                      objc_enumerationMutation(v48);
                    objc_msgSend(*(id *)(*((_QWORD *)&v138 + 1) + 8 * m), "description");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v53, "cls_indentBy:", 2);
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "appendFormat:", CFSTR("\n\n%@"), v54);

                  }
                  v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v138, v174, 16);
                }
                while (v50);
              }

            }
            v111 = (id)objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v142, v175, 16);
          }
          while (v111);
        }

        v44 = v99 + 1;
      }
      while (v99 + 1 != obja);
      obja = (char *)objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v146, v176, 16);
    }
    while (obja);
  }

  objc_msgSend(CFSTR("<Meaning Clues>"), "cls_indentBy:", 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "appendFormat:", CFSTR("\n\n%@"), v55);

  v56 = (void *)objc_opt_new();
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  -[NSMapTable objectEnumerator](v87->_meaningCluesByKey, "objectEnumerator");
  v92 = (id)objc_claimAutoreleasedReturnValue();
  v100 = (char *)objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v134, v173, 16);
  if (v100)
  {
    objb = *(id *)v135;
    do
    {
      v57 = 0;
      do
      {
        if (*(id *)v135 != objb)
          objc_enumerationMutation(v92);
        v104 = v57;
        v58 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * (_QWORD)v57);
        v130 = 0u;
        v131 = 0u;
        v132 = 0u;
        v133 = 0u;
        objc_msgSend(v58, "objectEnumerator");
        v108 = (id)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v130, v172, 16);
        if (v59)
        {
          v60 = v59;
          v112 = *(id *)v131;
          do
          {
            for (n = 0; n != v60; ++n)
            {
              if (*(id *)v131 != v112)
                objc_enumerationMutation(v108);
              v62 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * n);
              v126 = 0u;
              v127 = 0u;
              v128 = 0u;
              v129 = 0u;
              v63 = v62;
              v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v126, v171, 16);
              if (v64)
              {
                v65 = v64;
                v66 = *(_QWORD *)v127;
                do
                {
                  for (ii = 0; ii != v65; ++ii)
                  {
                    if (*(_QWORD *)v127 != v66)
                      objc_enumerationMutation(v63);
                    objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * ii), "stringValue");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v56, "addObject:", v68);

                  }
                  v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v126, v171, 16);
                }
                while (v65);
              }

            }
            v60 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v130, v172, 16);
          }
          while (v60);
        }

        v57 = v104 + 1;
      }
      while (v104 + 1 != v100);
      v100 = (char *)objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v134, v173, 16);
    }
    while (v100);
  }

  v69 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v56, "sortedArrayUsingSelector:", sel_compare_);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "componentsJoinedByString:", CFSTR(", "));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "stringWithFormat:", CFSTR("values:[%@]"), v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "cls_indentBy:", 2);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "appendFormat:", CFSTR("\n%@"), v73);

  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  -[NSMapTable objectEnumerator](v87->_meaningCluesByKey, "objectEnumerator");
  v88 = (id)objc_claimAutoreleasedReturnValue();
  v93 = (char *)objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v122, v170, 16);
  if (v93)
  {
    v90 = *(id *)v123;
    do
    {
      v74 = 0;
      do
      {
        if (*(id *)v123 != v90)
          objc_enumerationMutation(v88);
        objc = v74;
        v75 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * (_QWORD)v74);
        v118 = 0u;
        v119 = 0u;
        v120 = 0u;
        v121 = 0u;
        objc_msgSend(v75, "objectEnumerator");
        v101 = (id)objc_claimAutoreleasedReturnValue();
        v109 = (char *)objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v118, v169, 16);
        if (v109)
        {
          v105 = *(id *)v119;
          do
          {
            v76 = 0;
            do
            {
              if (*(id *)v119 != v105)
                objc_enumerationMutation(v101);
              v113 = v76;
              v77 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)v76);
              v114 = 0u;
              v115 = 0u;
              v116 = 0u;
              v117 = 0u;
              v78 = v77;
              v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v114, v168, 16);
              if (v79)
              {
                v80 = v79;
                v81 = *(_QWORD *)v115;
                do
                {
                  for (jj = 0; jj != v80; ++jj)
                  {
                    if (*(_QWORD *)v115 != v81)
                      objc_enumerationMutation(v78);
                    objc_msgSend(*(id *)(*((_QWORD *)&v114 + 1) + 8 * jj), "description");
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v83, "cls_indentBy:", 2);
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "appendFormat:", CFSTR("\n\n%@"), v84);

                  }
                  v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v114, v168, 16);
                }
                while (v80);
              }

              v76 = v113 + 1;
            }
            while (v113 + 1 != v109);
            v109 = (char *)objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v118, v169, 16);
          }
          while (v109);
        }

        v74 = objc + 1;
      }
      while (objc + 1 != v93);
      v93 = (char *)objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v122, v170, 16);
    }
    while (v93);
  }

  os_unfair_recursive_lock_unlock();
  v85 = v23;

  return v85;
}

- (void)_incrementVersionCount
{
  CLSClueCollection *obj;

  obj = self;
  objc_sync_enter(obj);
  ++obj->_versionCount;
  objc_sync_exit(obj);

}

- (id)inputCluesForKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_inputCluesByKey, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObjectsFromArray:", v7);
  os_unfair_recursive_lock_unlock();

  return v6;
}

- (id)inputClues
{
  void *v3;
  NSMapTable *inputCluesByKey;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  inputCluesByKey = self->_inputCluesByKey;
  if (inputCluesByKey)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    NSAllMapTableKeys(inputCluesByKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          -[NSMapTable objectForKey:](self->_inputCluesByKey, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)uniqueInputClues
{
  void *v3;
  NSMapTable *inputCluesByKey;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  inputCluesByKey = self->_inputCluesByKey;
  if (inputCluesByKey)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    NSAllMapTableKeys(inputCluesByKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)MEMORY[0x1E0C99E60];
          -[CLSClueCollection inputCluesForKey:](self, "inputCluesForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9), (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setWithArray:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "unionSet:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)outputCluesForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_outputCluesByKey, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v6, "objectEnumerator", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v5, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  os_unfair_recursive_lock_unlock();
  return v5;
}

- (id)uniqueOutputCluesForKey:(id)a3
{
  id v4;
  void *v5;
  NSMapTable *v6;
  NSMapTable *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_outputCluesByKey, "objectForKey:", v4);
  v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    NSAllMapTableKeys(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          -[CLSClueCollection uniqueOutputClueForKey:andValue:](self, "uniqueOutputClueForKey:andValue:", v4, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v5, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  os_unfair_recursive_lock_unlock();

  return v5;
}

- (id)outputCluesForKey:(id)a3 andValue:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_outputCluesByKey, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObjectsFromArray:", v11);
  os_unfair_recursive_lock_unlock();

  return v9;
}

- (id)uniqueOutputClueForKey:(id)a3 andValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  double v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[CLSOutputClue clueWithValue:forKey:](CLSOutputClue, "clueWithValue:forKey:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0.0;
  objc_msgSend(v8, "setConfidence:", 0.0);
  objc_msgSend(v8, "setRelevance:", 0.0);
  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_outputCluesByKey, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v13 = 0.0;
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v17, "relevance");
        if (v18 >= v13)
          v13 = v18;
        objc_msgSend(v17, "confidence");
        if (v19 >= v9)
          v9 = v19;
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v8, "setRelevance:", v13);
    objc_msgSend(v8, "setConfidence:", fmin(v9 + log10(sqrt((double)(unint64_t)objc_msgSend(v11, "count"))), 1.0));
  }
  os_unfair_recursive_lock_unlock();
  objc_msgSend(v8, "score");
  if (v20 == 0.0)
    v21 = 0;
  else
    v21 = v8;

  return v21;
}

- (id)uniqueOutputClues
{
  void *v3;
  NSMapTable *outputCluesByKey;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  outputCluesByKey = self->_outputCluesByKey;
  if (outputCluesByKey)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    NSAllMapTableKeys(outputCluesByKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          -[CLSClueCollection uniqueOutputCluesForKey:](self, "uniqueOutputCluesForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "unionSet:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)outputClues
{
  void *v3;
  NSMapTable *outputCluesByKey;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_unfair_recursive_lock_s *p_recursiveLock;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  outputCluesByKey = self->_outputCluesByKey;
  if (outputCluesByKey)
  {
    p_recursiveLock = &self->_recursiveLock;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    NSAllMapTableKeys(outputCluesByKey);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(obj);
          -[NSMapTable objectForKey:](self->_outputCluesByKey, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v8), p_recursiveLock);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          objc_msgSend(v9, "objectEnumerator");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v19;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v19 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14++));
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v6);
    }

  }
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (BOOL)hasOutputClueWithKey:(id)a3 andValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_outputCluesByKey, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v9, "count") != 0;
  os_unfair_recursive_lock_unlock();

  return (char)v6;
}

- (BOOL)hasOutputClueWithKey:(id)a3 value:(id)a4 andMinimumScore:(double)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_outputCluesByKey, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "score", (_QWORD)v17);
        if (v15 >= a5)
        {
          LOBYTE(v12) = 1;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_recursive_lock_unlock();
  return v12;
}

- (id)meaningClues
{
  void *v3;
  NSMapTable *meaningCluesByKey;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  meaningCluesByKey = self->_meaningCluesByKey;
  if (meaningCluesByKey)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    NSAllMapTableKeys(meaningCluesByKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          -[CLSClueCollection meaningCluesForKey:](self, "meaningCluesForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)uniqueMeaningClues
{
  void *v3;
  NSMapTable *meaningCluesByKey;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  meaningCluesByKey = self->_meaningCluesByKey;
  if (meaningCluesByKey)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    NSAllMapTableKeys(meaningCluesByKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          -[CLSClueCollection uniqueMeaningCluesForKey:](self, "uniqueMeaningCluesForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "unionSet:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)meaningCluesForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_meaningCluesByKey, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v6, "objectEnumerator", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v5, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  os_unfair_recursive_lock_unlock();
  return v5;
}

- (id)uniqueMeaningCluesForKey:(id)a3
{
  id v4;
  void *v5;
  NSMapTable *v6;
  NSMapTable *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_meaningCluesByKey, "objectForKey:", v4);
  v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    NSAllMapTableKeys(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          -[CLSClueCollection uniqueMeaningClueForKey:andValue:](self, "uniqueMeaningClueForKey:andValue:", v4, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v5, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  os_unfair_recursive_lock_unlock();

  return v5;
}

- (id)meaningCluesForKey:(id)a3 andValue:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_meaningCluesByKey, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObjectsFromArray:", v11);
  os_unfair_recursive_lock_unlock();

  return v9;
}

- (id)uniqueMeaningClueForKey:(id)a3 andValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  double v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[CLSMeaningClue clueWithValue:forKey:](CLSMeaningClue, "clueWithValue:forKey:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0.0;
  objc_msgSend(v8, "setConfidence:", 0.0);
  objc_msgSend(v8, "setRelevance:", 0.0);
  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_meaningCluesByKey, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v13 = 0.0;
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v17, "relevance");
        if (v18 >= v13)
          v13 = v18;
        objc_msgSend(v17, "confidence");
        if (v19 >= v9)
          v9 = v19;
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v8, "setRelevance:", v13);
    objc_msgSend(v8, "setConfidence:", fmin(v9 + log10(sqrt((double)(unint64_t)objc_msgSend(v11, "count"))), 1.0));
  }
  os_unfair_recursive_lock_unlock();
  objc_msgSend(v8, "score");
  if (v20 == 0.0)
    v21 = 0;
  else
    v21 = v8;

  return v21;
}

- (BOOL)hasMeaningClueWithKey:(id)a3 andValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_meaningCluesByKey, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v9, "count") != 0;
  os_unfair_recursive_lock_unlock();

  return (char)v6;
}

- (BOOL)hasMeaningClueWithKey:(id)a3 value:(id)a4 andMinimumScore:(double)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_meaningCluesByKey, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "score", (_QWORD)v17);
        if (v15 >= a5)
        {
          LOBYTE(v12) = 1;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_recursive_lock_unlock();
  return v12;
}

- (void)enumerateTimeOfDayClues:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CLSClueCollection outputCluesForKey:](self, "outputCluesForKey:", CFSTR("Time of Day"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v4);

}

- (CLSMeaningClue)locationMobilityClue
{
  void *v2;
  void *v3;

  -[CLSClueCollection meaningCluesForKey:](self, "meaningCluesForKey:", CFSTR("Location Mobility"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLSMeaningClue *)v3;
}

- (double)timeInterval
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[CLSClueCollection localEndDate](self, "localEndDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSClueCollection localStartDate](self, "localStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (unint64_t)numberOfDays
{
  double v2;

  -[CLSClueCollection timeInterval](self, "timeInterval");
  return vcvtpd_u64_f64(v2 / 86400.0);
}

- (int64_t)year
{
  void *v2;
  int64_t v3;

  -[CLSClueCollection localEndDate](self, "localEndDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[CLSCalendar yearFromDate:](CLSCalendar, "yearFromDate:", v2);

  return v3;
}

- (void)enumerateTimeClues:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_inputCluesByKey, "objectForKey:", CFSTR("Global Time"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "copy");

  os_unfair_recursive_lock_unlock();
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v4);

}

- (id)universalStartDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_inputCluesByKey, "objectForKey:", CFSTR("Global Time"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  os_unfair_recursive_lock_unlock();
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("universalStartDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)universalEndDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_inputCluesByKey, "objectForKey:", CFSTR("Global Time"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  os_unfair_recursive_lock_unlock();
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("universalEndDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)universalDates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[CLSClueCollection universalStartDate](self, "universalStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSClueCollection universalEndDate](self, "universalEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localStartDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_inputCluesByKey, "objectForKey:", CFSTR("Global Time"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  os_unfair_recursive_lock_unlock();
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("localStartDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)localEndDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_inputCluesByKey, "objectForKey:", CFSTR("Global Time"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  os_unfair_recursive_lock_unlock();
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("localEndDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)localDates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[CLSClueCollection localStartDate](self, "localStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSClueCollection localEndDate](self, "localEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)universalDateInterval
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  -[CLSClueCollection universalStartDate](self, "universalStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSClueCollection universalEndDate](self, "universalEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);

  return v6;
}

- (unint64_t)numberOfTimes
{
  void *v2;
  unint64_t v3;

  -[CLSClueCollection inputCluesForKey:](self, "inputCluesForKey:", CFSTR("Global Time"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)enumerateLocationClues:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_inputCluesByKey, "objectForKey:", CFSTR("Global Location"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "copy");

  os_unfair_recursive_lock_unlock();
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v4);

}

- (id)locationPlacemarks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[CLSClueCollection inputCluesForKey:](self, "inputCluesForKey:", CFSTR("Global Location"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("placemark"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)locationRegions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[CLSClueCollection inputCluesForKey:](self, "inputCluesForKey:", CFSTR("Global Location"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("region"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)locationRegionsInPlacemarks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[CLSClueCollection inputCluesForKey:](self, "inputCluesForKey:", CFSTR("Global Location"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("regionInPlacemark"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)locations
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[CLSClueCollection inputCluesForKey:](self, "inputCluesForKey:", CFSTR("Global Location"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("location"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)numberOfLocations
{
  void *v2;
  unint64_t v3;

  -[CLSClueCollection inputCluesForKey:](self, "inputCluesForKey:", CFSTR("Global Location"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)enumeratePeopleClues:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_inputCluesByKey, "objectForKey:", CFSTR("Global People"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "copy");

  os_unfair_recursive_lock_unlock();
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v4);

}

- (id)peopleNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[CLSClueCollection inputCluesForKey:](self, "inputCluesForKey:", CFSTR("Global People"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)numberOfPersons
{
  void *v2;
  unint64_t v3;

  -[CLSClueCollection inputCluesForKey:](self, "inputCluesForKey:", CFSTR("Global People"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)mePerson
{
  return -[CLSInputPeopleClue person](self->_mePersonClue, "person");
}

- (void)prepareWithProgressBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CLSInputClue prepareIfNeeded](self->_mePersonClue, "prepareIfNeeded", a3);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CLSClueCollection inputClues](self, "inputClues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "prepareIfNeeded");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_mergeInputClue:(id)a3
{
  id v4;
  NSMapTable *inputCluesByKey;
  void *v6;
  void *v7;
  NSMapTable *v8;
  void *v9;
  id v10;

  v4 = a3;
  inputCluesByKey = self->_inputCluesByKey;
  v10 = v4;
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](inputCluesByKey, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "addObject:", v10);
  }
  else
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "addObject:", v10);
    v8 = self->_inputCluesByKey;
    objc_msgSend(v10, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v8, "setObject:forKey:", v7, v9);

  }
}

- (void)_mergeOutputClue:(id)a3
{
  id v4;
  NSMapTable *outputCluesByKey;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMapTable *v13;
  id v14;

  v4 = a3;
  outputCluesByKey = self->_outputCluesByKey;
  v14 = v4;
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](outputCluesByKey, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v14, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(v14, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v9, v10);

    }
    objc_msgSend(v9, "addObject:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v11, v12);

    v13 = self->_outputCluesByKey;
    objc_msgSend(v14, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v13, "setObject:forKey:", v7, v9);
  }

}

- (void)_mergeMeaningClue:(id)a3
{
  id v4;
  NSMapTable *meaningCluesByKey;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMapTable *v13;
  id v14;

  v4 = a3;
  meaningCluesByKey = self->_meaningCluesByKey;
  v14 = v4;
  objc_msgSend(v4, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](meaningCluesByKey, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v14, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(v14, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v9, v10);

    }
    objc_msgSend(v9, "addObject:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v11, v12);

    v13 = self->_meaningCluesByKey;
    objc_msgSend(v14, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v13, "setObject:forKey:", v7, v9);
  }

}

- (void)mergeClues:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _UNKNOWN **v9;
  _UNKNOWN **v10;
  _UNKNOWN **v11;
  uint64_t v12;
  uint64_t v13;
  _UNKNOWN **v14;
  id v15;
  _UNKNOWN **v16;
  _UNKNOWN **v17;
  void *v18;
  NSObject *v19;
  CLSClueCollection *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    v9 = &off_1E84F6000;
    v10 = &off_1E84F6000;
    v11 = &off_1E84F6000;
    v20 = self;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[CLSClueCollection _mergeInputClue:](self, "_mergeInputClue:", v13);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[CLSClueCollection _mergeOutputClue:](self, "_mergeOutputClue:", v13);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[CLSClueCollection _mergeMeaningClue:](self, "_mergeMeaningClue:", v13);
            }
            else
            {
              v14 = v9;
              v15 = v5;
              v16 = v10;
              v17 = v11;
              +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "loggingConnection");
              v19 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v26 = v13;
                _os_log_error_impl(&dword_1CAB79000, v19, OS_LOG_TYPE_ERROR, "Cannot merge clue: %@", buf, 0xCu);
              }

              v11 = v17;
              v10 = v16;
              v5 = v15;
              v9 = v14;
              self = v20;
            }
          }
        }
        ++v12;
      }
      while (v7 != v12);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v7);
  }

  -[CLSClueCollection _incrementVersionCount](self, "_incrementVersionCount");
  os_unfair_recursive_lock_unlock();

}

- (id)peopleDescription
{
  return -[CLSClueCollection peopleDescriptionWithoutPeople:](self, "peopleDescriptionWithoutPeople:", 0);
}

- (id)peopleDescriptionWithoutPeople:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  -[CLSClueCollection outputCluesForKey:](self, "outputCluesForKey:", CFSTR("People Relationship"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("value != %@"), CFSTR("Myself"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v8 = (void *)MEMORY[0x1E0CB3880];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52__CLSClueCollection_peopleDescriptionWithoutPeople___block_invoke;
    v15[3] = &unk_1E84F8AF8;
    v16 = v4;
    objc_msgSend(v8, "predicateWithBlock:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  objc_msgSend(v7, "valueForKey:", CFSTR("relatedPerson"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("score"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSPersonIdentity presentationStringForPeople:withScores:](CLSPersonIdentity, "presentationStringForPeople:withScores:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)versionCount
{
  return self->_versionCount;
}

- (CLSInputPeopleClue)mePersonClue
{
  return self->_mePersonClue;
}

- (void)setMePersonClue:(id)a3
{
  objc_storeStrong((id *)&self->_mePersonClue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meaningCluesByKey, 0);
  objc_storeStrong((id *)&self->_outputCluesByKey, 0);
  objc_storeStrong((id *)&self->_inputCluesByKey, 0);
  objc_storeStrong((id *)&self->_mePersonClue, 0);
}

uint64_t __52__CLSClueCollection_peopleDescriptionWithoutPeople___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "relatedPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) ^ 1;

  return v4;
}

void __32__CLSClueCollection_description__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "description");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cls_indentBy:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\n%@"), v3);

}

void __32__CLSClueCollection_description__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "description");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cls_indentBy:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\n%@"), v3);

}

void __32__CLSClueCollection_description__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "description");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cls_indentBy:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\n%@"), v3);

}

@end
