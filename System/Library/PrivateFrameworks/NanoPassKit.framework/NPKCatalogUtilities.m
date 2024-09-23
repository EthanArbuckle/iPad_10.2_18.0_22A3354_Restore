@implementation NPKCatalogUtilities

+ (id)catalogByMergingCompanionCatalog:(id)a3 intoWatchCatalog:(id)a4 watchPasses:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t ii;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t jj;
  uint64_t v58;
  void *v59;
  void *v60;
  void *kk;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t mm;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  char v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t nn;
  void *v89;
  void *v90;
  int v91;
  void *v92;
  uint64_t v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  void *v99;
  void *v100;
  id v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  id v111;
  id v112;
  id obj;
  id obja;
  id objb;
  id objc;
  id v117;
  id v118;
  id v119;
  id v120;
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
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
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
  _BYTE v180[128];
  uint64_t v181;

  v181 = *MEMORY[0x24BDAC8D0];
  v101 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = 0u;
  v166 = 0u;
  v167 = 0u;
  v168 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v165, v180, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v166;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v166 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * i);
        objc_msgSend(v15, "uniqueID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v9, "setObject:forKey:", v15, v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v165, v180, 16);
    }
    while (v12);
  }
  v99 = v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v117 = (id)objc_claimAutoreleasedReturnValue();
  v161 = 0u;
  v162 = 0u;
  v163 = 0u;
  v164 = 0u;
  v100 = v7;
  objc_msgSend(v7, "groups");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v161, v179, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v162;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v162 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * j);
        v157 = 0u;
        v158 = 0u;
        v159 = 0u;
        v160 = 0u;
        objc_msgSend(v21, "uniqueIDs");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v157, v178, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v158;
          while (2)
          {
            for (k = 0; k != v24; ++k)
            {
              if (*(_QWORD *)v158 != v25)
                objc_enumerationMutation(v22);
              objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v157 + 1) + 8 * k));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (v27)
              {
                v28 = v27;
                v29 = objc_msgSend(v27, "passType");
                if (objc_msgSend(v28, "style") == 6 && v29 == 1)
                  v31 = v105;
                else
                  v31 = v117;
                objc_msgSend(v31, "addObject:", v21);

                goto LABEL_31;
              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v157, v178, 16);
            if (v24)
              continue;
            break;
          }
        }
LABEL_31:

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v161, v179, 16);
    }
    while (v18);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v110 = (id)objc_claimAutoreleasedReturnValue();
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  v156 = 0u;
  objc_msgSend(v101, "groups");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v153, v177, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v154;
    do
    {
      for (m = 0; m != v33; ++m)
      {
        if (*(_QWORD *)v154 != v34)
          objc_enumerationMutation(obja);
        v36 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * m);
        v149 = 0u;
        v150 = 0u;
        v151 = 0u;
        v152 = 0u;
        objc_msgSend(v36, "uniqueIDs");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v149, v176, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v150;
          while (2)
          {
            for (n = 0; n != v39; ++n)
            {
              if (*(_QWORD *)v150 != v40)
                objc_enumerationMutation(v37);
              objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * n));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              if (v42)
              {
                v43 = v42;
                v44 = objc_msgSend(v42, "passType");
                v45 = objc_msgSend(v43, "style");
                if (v44 != 1 || v45 != 6)
                {
                  v47 = (void *)objc_msgSend(v36, "copy");
                  objc_msgSend(v110, "addObject:", v47);

                }
                goto LABEL_53;
              }
            }
            v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v149, v176, 16);
            if (v39)
              continue;
            break;
          }
        }
LABEL_53:

      }
      v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v153, v177, 16);
    }
    while (v33);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = 0u;
  v146 = 0u;
  v147 = 0u;
  v148 = 0u;
  v112 = v117;
  v49 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v145, v175, 16);
  if (v49)
  {
    v50 = v49;
    v118 = *(id *)v146;
    do
    {
      for (ii = 0; ii != v50; ++ii)
      {
        if (*(id *)v146 != v118)
          objc_enumerationMutation(v112);
        v52 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * ii);
        v141 = 0u;
        v142 = 0u;
        v143 = 0u;
        v144 = 0u;
        objc_msgSend(v52, "uniqueIDs");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v141, v174, 16);
        if (v54)
        {
          v55 = v54;
          v56 = *(_QWORD *)v142;
          do
          {
            for (jj = 0; jj != v55; ++jj)
            {
              if (*(_QWORD *)v142 != v56)
                objc_enumerationMutation(v53);
              v58 = *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * jj);
              objc_msgSend(v9, "objectForKey:", v58);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              if (v59)
                objc_msgSend(v48, "addObject:", v58);

            }
            v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v141, v174, 16);
          }
          while (v55);
        }

      }
      v50 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v145, v175, 16);
    }
    while (v50);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  v106 = v110;
  v119 = (id)objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v137, v173, 16);
  if (v119)
  {
    objb = *(id *)v138;
    do
    {
      for (kk = 0; kk != v119; kk = (char *)kk + 1)
      {
        if (*(id *)v138 != objb)
          objc_enumerationMutation(v106);
        v62 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * (_QWORD)kk);
        v133 = 0u;
        v134 = 0u;
        v135 = 0u;
        v136 = 0u;
        objc_msgSend(v62, "uniqueIDs");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v133, v172, 16);
        if (v64)
        {
          v65 = v64;
          v66 = *(_QWORD *)v134;
          do
          {
            for (mm = 0; mm != v65; ++mm)
            {
              if (*(_QWORD *)v134 != v66)
                objc_enumerationMutation(v63);
              v68 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * mm);
              objc_msgSend(v9, "objectForKey:", v68);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              if (v69)
                objc_msgSend(v60, "addObject:", v68);

            }
            v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v133, v172, 16);
          }
          while (v65);
        }

      }
      v119 = (id)objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v137, v173, 16);
    }
    while (v119);
  }

  v70 = (void *)objc_msgSend(v48, "mutableCopy");
  objc_msgSend(v70, "minusSet:", v60);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v104 = v70;
  v108 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v129, v171, 16);
  if (v108)
  {
    v107 = *(_QWORD *)v130;
    do
    {
      v71 = 0;
      do
      {
        if (*(_QWORD *)v130 != v107)
          objc_enumerationMutation(v104);
        v72 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * v71);
        v125 = 0u;
        v126 = 0u;
        v127 = 0u;
        v128 = 0u;
        v120 = v112;
        v73 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v125, v170, 16);
        if (v73)
        {
          v74 = v73;
          v109 = v71;
          v75 = *(_QWORD *)v126;
LABEL_94:
          v76 = 0;
          while (1)
          {
            if (*(_QWORD *)v126 != v75)
              objc_enumerationMutation(v120);
            v77 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * v76);
            objc_msgSend(v77, "uniqueIDs");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = objc_msgSend(v78, "containsObject:", v72);

            if ((v79 & 1) != 0)
              break;
            if (v74 == ++v76)
            {
              v74 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v125, v170, 16);
              if (v74)
                goto LABEL_94;
              v80 = 0;
              v71 = v109;
              goto LABEL_115;
            }
          }
          v80 = v77;

          if (!v80)
          {
            v71 = v109;
            goto LABEL_117;
          }
          v71 = v109;
          if ((objc_msgSend(v103, "containsObject:", v80) & 1) != 0)
            goto LABEL_117;
          v81 = (void *)objc_msgSend(v60, "mutableCopy");
          v82 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v80, "uniqueIDs");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "setWithArray:", v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "intersectSet:", v84);

          v120 = v81;
          if (objc_msgSend(v81, "count"))
          {
            v102 = v80;
            objc_msgSend(v81, "anyObject");
            objc = (id)objc_claimAutoreleasedReturnValue();
            v121 = 0u;
            v122 = 0u;
            v123 = 0u;
            v124 = 0u;
            v111 = v106;
            v85 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v121, v169, 16);
            if (v85)
            {
              v86 = v85;
              v87 = *(_QWORD *)v122;
              while (2)
              {
                for (nn = 0; nn != v86; ++nn)
                {
                  if (*(_QWORD *)v122 != v87)
                    objc_enumerationMutation(v111);
                  v89 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * nn);
                  objc_msgSend(v89, "uniqueIDs");
                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                  v91 = objc_msgSend(v90, "containsObject:", objc);

                  if (v91)
                  {
                    objc_msgSend(v89, "uniqueIDs");
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v92, "addObject:", v72);

                    v71 = v109;
                    v80 = v102;
                    goto LABEL_115;
                  }
                }
                v86 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v121, v169, 16);
                if (v86)
                  continue;
                break;
              }
            }

            v71 = v109;
            v80 = v102;
          }
          objc_msgSend(v103, "addObject:", v80);
        }
        else
        {
          v80 = 0;
        }
LABEL_115:

LABEL_117:
        ++v71;
      }
      while (v71 != v108);
      v93 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v129, v171, 16);
      v108 = v93;
    }
    while (v93);
  }

  v94 = objc_alloc_init(MEMORY[0x24BE6EA78]);
  objc_msgSend(v94, "groups");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObjectsFromArray:", v105);

  objc_msgSend(v94, "groups");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "addObjectsFromArray:", v103);

  objc_msgSend(v94, "groups");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "addObjectsFromArray:", v106);

  return v94;
}

@end
