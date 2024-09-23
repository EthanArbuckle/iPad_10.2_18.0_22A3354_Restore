@implementation GeometricCutTools

+ (id)cleanTextDetectorOutput:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  id v26;
  void *v27;
  id v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;
  CGRect v52;
  CGRect v53;

  v51 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v29;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v45;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v45 != v31)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v34);
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(v3, "subFeatures");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v5)
        {
          v6 = *(_QWORD *)v41;
          do
          {
            v7 = 0;
            do
            {
              if (*(_QWORD *)v41 != v6)
                objc_enumerationMutation(v4);
              v8 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v7);
              v36 = 0u;
              v37 = 0u;
              v38 = 0u;
              v39 = 0u;
              objc_msgSend(v3, "subFeatures");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
              if (v10)
              {
                v11 = *(_QWORD *)v37;
                while (2)
                {
                  v12 = 0;
                  do
                  {
                    if (*(_QWORD *)v37 != v11)
                      objc_enumerationMutation(v9);
                    v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v12);
                    if (v13 != v8)
                    {
                      objc_msgSend(v13, "bounds");
                      v15 = v14;
                      v17 = v16;
                      v19 = v18;
                      v21 = v20;
                      objc_msgSend(v8, "bounds");
                      v53.origin.x = v22;
                      v53.origin.y = v23;
                      v53.size.width = v24;
                      v53.size.height = v25;
                      v52.origin.x = v15;
                      v52.origin.y = v17;
                      v52.size.width = v19;
                      v52.size.height = v21;
                      if (CGRectContainsRect(v52, v53))
                      {

                        goto LABEL_22;
                      }
                    }
                    ++v12;
                  }
                  while (v10 != v12);
                  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
                  if (v10)
                    continue;
                  break;
                }
              }

              objc_msgSend(v35, "addObject:", v8);
LABEL_22:
              ++v7;
            }
            while (v7 != v5);
            v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          }
          while (v5);
        }

        v26 = objc_alloc_init(MEMORY[0x24BEB5B98]);
        objc_msgSend(v3, "bounds");
        objc_msgSend(v26, "setBounds:");
        objc_msgSend(v3, "topRight");
        objc_msgSend(v26, "setTopRight:");
        objc_msgSend(v3, "topLeft");
        objc_msgSend(v26, "setTopLeft:");
        objc_msgSend(v3, "bottomRight");
        objc_msgSend(v26, "setBottomRight:");
        objc_msgSend(v3, "bottomLeft");
        objc_msgSend(v26, "setBottomLeft:");
        objc_msgSend(v26, "setSubFeatures:", v35);
        objc_msgSend(v33, "addObject:", v26);

        ++v34;
      }
      while (v34 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v32);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v33);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)findCorrectedBoundingBoxOfTextFeature:(id)a3 inImageWithSize:(CGSize)a4
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  double v34;
  id v35;
  void *v36;
  uint64_t *v37;
  uint64_t **v38;
  uint64_t **v39;
  unint64_t v40;
  _QWORD *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  double *v70;
  double *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  uint64_t v78;
  double v79;
  uint64_t v80;
  uint64_t k;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  uint64_t *v113;
  uint64_t **v114;
  uint64_t *v115;
  uint64_t **v116;
  unint64_t v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  double v130;
  void *v131;
  void *v132;
  id v134;
  id v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  void *v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  uint64_t **v158;
  uint64_t *v159;
  uint64_t v160;
  void *v161;
  char *v162;
  char *v163;
  void *__p;
  char *v165;
  char *v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  void *v171;
  _BYTE *v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  uint64_t v181;
  NSPoint v182;
  NSPoint v183;
  NSPoint v184;
  NSPoint v185;

  v181 = *MEMORY[0x24BDAC8D0];
  v134 = a3;
  objc_msgSend(v134, "subFeatures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 2)
  {
    v135 = objc_alloc_init(MEMORY[0x24BEB5B98]);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = 0u;
    v176 = 0u;
    v173 = 0u;
    v174 = 0u;
    objc_msgSend(v134, "subFeatures");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v173, v180, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v174;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v174 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * i);
          v12 = objc_alloc_init(MEMORY[0x24BEB5B98]);
          objc_msgSend(v11, "bounds");
          v14 = v13;
          objc_msgSend(v11, "bounds");
          v16 = v15;
          objc_msgSend(v11, "bounds");
          v18 = v17;
          objc_msgSend(v11, "bounds");
          objc_msgSend(v12, "setBounds:", a4.width * v14, a4.height * v16, a4.width * v18, a4.height * v19);
          objc_msgSend(v149, "addObject:", v12);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v173, v180, 16);
      }
      while (v8);
    }

    objc_msgSend(v135, "setSubFeatures:", v149);
    objc_msgSend(v135, "subFeatures");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<double>::vector(&v171, objc_msgSend(v20, "count"));

    v169 = 0u;
    v170 = 0u;
    v167 = 0u;
    v168 = 0u;
    objc_msgSend(v135, "subFeatures");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v167, v179, 16);
    if (v22)
    {
      v23 = 0;
      v24 = *(_QWORD *)v168;
      do
      {
        v25 = 0;
        v26 = v23;
        do
        {
          if (*(_QWORD *)v168 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v167 + 1) + 8 * v25), "bounds");
          v23 = v26 + 1;
          *((_QWORD *)v171 + v26) = v27;
          ++v25;
          ++v26;
        }
        while (v22 != v25);
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v167, v179, 16);
      }
      while (v22);
    }

    std::__sort<std::__less<double,double> &,double *>();
    v28 = *(double *)((char *)v171 + (((v172 - (_BYTE *)v171) >> 1) & 0xFFFFFFFFFFFFFFF8));
    __p = 0;
    v165 = 0;
    v166 = 0;
    v161 = 0;
    v162 = 0;
    v163 = 0;
    v159 = 0;
    v160 = 0;
    v158 = &v159;
    v156 = 0u;
    v157 = 0u;
    v154 = 0u;
    v155 = 0u;
    objc_msgSend(v135, "subFeatures");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v154, v178, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v155;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v155 != v31)
            objc_enumerationMutation(v29);
          v33 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * j);
          objc_msgSend(v33, "bounds");
          if (vabdd_f64(v34, v28) < v28 * 0.1)
          {
            v35 = v33;
            v36 = v35;
            v37 = v159;
            v38 = &v159;
            v39 = &v159;
            if (v159)
            {
              while (1)
              {
                while (1)
                {
                  v39 = (uint64_t **)v37;
                  v40 = v37[4];
                  if (v40 <= (unint64_t)v35)
                    break;
                  v37 = *v39;
                  v38 = v39;
                  if (!*v39)
                    goto LABEL_30;
                }
                if (v40 >= (unint64_t)v35)
                  break;
                v37 = v39[1];
                if (!v37)
                {
                  v38 = v39 + 1;
                  goto LABEL_30;
                }
              }
              v42 = v35;
            }
            else
            {
LABEL_30:
              v41 = operator new(0x30uLL);
              v41[4] = v36;
              *((_DWORD *)v41 + 10) = 1;
              *v41 = 0;
              v41[1] = 0;
              v41[2] = v39;
              *v38 = v41;
              if (*v158)
              {
                v158 = (uint64_t **)*v158;
                v41 = *v38;
              }
              std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v159, v41);
              v42 = 0;
              ++v160;
            }

            objc_msgSend(v36, "bounds");
            v44 = v43;
            v45 = v165;
            if (v165 >= v166)
            {
              v47 = (char *)__p;
              v48 = (v165 - (_BYTE *)__p) >> 3;
              v49 = v48 + 1;
              if ((unint64_t)(v48 + 1) >> 61)
                std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
              v50 = v166 - (_BYTE *)__p;
              if ((v166 - (_BYTE *)__p) >> 2 > v49)
                v49 = v50 >> 2;
              if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF8)
                v51 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v51 = v49;
              if (v51)
              {
                v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v166, v51);
                v47 = (char *)__p;
                v45 = v165;
              }
              else
              {
                v52 = 0;
              }
              v53 = &v52[8 * v48];
              *(_QWORD *)v53 = v44;
              v46 = v53 + 8;
              while (v45 != v47)
              {
                v54 = *((_QWORD *)v45 - 1);
                v45 -= 8;
                *((_QWORD *)v53 - 1) = v54;
                v53 -= 8;
              }
              __p = v53;
              v165 = v46;
              v166 = &v52[8 * v51];
              if (v47)
                operator delete(v47);
            }
            else
            {
              *(_QWORD *)v165 = v43;
              v46 = v45 + 8;
            }
            v165 = v46;
            objc_msgSend(v36, "bounds");
            v56 = v55;
            v57 = v162;
            if (v162 >= v163)
            {
              v59 = (char *)v161;
              v60 = (v162 - (_BYTE *)v161) >> 3;
              v61 = v60 + 1;
              if ((unint64_t)(v60 + 1) >> 61)
                std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
              v62 = v163 - (_BYTE *)v161;
              if ((v163 - (_BYTE *)v161) >> 2 > v61)
                v61 = v62 >> 2;
              if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8)
                v63 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v63 = v61;
              if (v63)
              {
                v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v163, v63);
                v59 = (char *)v161;
                v57 = v162;
              }
              else
              {
                v64 = 0;
              }
              v65 = &v64[8 * v60];
              *(_QWORD *)v65 = v56;
              v58 = v65 + 8;
              while (v57 != v59)
              {
                v66 = *((_QWORD *)v57 - 1);
                v57 -= 8;
                *((_QWORD *)v65 - 1) = v66;
                v65 -= 8;
              }
              v161 = v65;
              v162 = v58;
              v163 = &v64[8 * v63];
              if (v59)
                operator delete(v59);
            }
            else
            {
              *(_QWORD *)v162 = v55;
              v58 = v57 + 8;
            }
            v162 = v58;
          }
        }
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v154, v178, 16);
      }
      while (v30);
    }

    v6 = 0;
    v67 = v165 - (_BYTE *)__p;
    if (v165 != __p && (unint64_t)v67 >= 0x10)
    {
      if ((unint64_t)(v67 >> 3) <= 1)
        v68 = 1;
      else
        v68 = v67 >> 3;
      v69 = 0.0;
      v70 = (double *)__p;
      v71 = (double *)v161;
      v72 = 0.0;
      do
      {
        v73 = *v70++;
        v74 = v73 - *(double *)__p;
        v75 = *v71++;
        v69 = v69 + v74 * (v75 - *(double *)v161);
        v72 = v72 + v74 * v74;
        --v68;
      }
      while (v68);
      v76 = v69 / v72;
      v140 = *(double *)((char *)v161 + (((v162 - (_BYTE *)v161) >> 1) & 0xFFFFFFFFFFFFFFF8));
      v141 = *(double *)((char *)__p + ((4 * (v67 >> 3)) & 0xFFFFFFFFFFFFFFF8));
      v150 = 0u;
      v151 = 0u;
      v152 = 0u;
      v153 = 0u;
      objc_msgSend(v135, "subFeatures");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v150, v177, 16);
      v79 = sqrt(v76 * v76 + 1.0);
      v142 = v76 / v79;
      v139 = 1.0 / v79;
      v136 = -(1.0 / v79);
      if (v78)
      {
        v80 = *(_QWORD *)v151;
        v137 = -INFINITY;
        v138 = INFINITY;
        v146 = -INFINITY;
        v147 = INFINITY;
        do
        {
          for (k = 0; k != v78; ++k)
          {
            if (*(_QWORD *)v151 != v80)
              objc_enumerationMutation(v77);
            v82 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * k);
            objc_msgSend(v82, "bounds");
            v145 = v83;
            objc_msgSend(v82, "bounds");
            v144 = v84;
            objc_msgSend(v82, "bounds");
            v143 = v85;
            objc_msgSend(v82, "bounds");
            v87 = v86;
            objc_msgSend(v82, "bounds");
            v89 = v88;
            objc_msgSend(v82, "bounds");
            v91 = v90;
            objc_msgSend(v82, "bounds");
            v93 = v92;
            objc_msgSend(v82, "bounds");
            v95 = v94;
            objc_msgSend(v82, "bounds");
            v97 = v96;
            objc_msgSend(v82, "bounds");
            v99 = v98;
            objc_msgSend(v82, "bounds");
            v101 = v100;
            objc_msgSend(v82, "bounds");
            v103 = v143 + v87 - v141;
            v104 = v91 + v93 - v141;
            v105 = v95 + v97 - v140;
            v106 = v101 + v102 - v140;
            v107 = v142 * (v144 - v140) + (v145 - v141) * v139;
            v108 = v142 * (v89 - v140) + v103 * v139;
            v109 = v142 * v105 + v104 * v139;
            v110 = v142 * v106 + (v99 - v141) * v139;
            v111 = v147;
            if (v107 < v147)
              v111 = v142 * (v144 - v140) + (v145 - v141) * v139;
            if (v108 < v111)
              v111 = v142 * (v89 - v140) + v103 * v139;
            if (v109 < v111)
              v111 = v142 * v105 + v104 * v139;
            if (v110 >= v111)
              v112 = v111;
            else
              v112 = v142 * v106 + (v99 - v141) * v139;
            if (v107 <= v146)
              v107 = v146;
            if (v108 > v107)
              v107 = v142 * (v89 - v140) + v103 * v139;
            if (v109 > v107)
              v107 = v142 * v105 + v104 * v139;
            if (v110 > v107)
              v107 = v142 * v106 + (v99 - v141) * v139;
            v146 = v107;
            v147 = v112;
            v113 = v159;
            if (v159)
            {
              v114 = &v159;
              do
              {
                v115 = v113;
                v116 = v114;
                v117 = v113[4];
                if (v117 >= (unint64_t)v82)
                  v114 = (uint64_t **)v113;
                else
                  ++v113;
                v113 = (uint64_t *)*v113;
              }
              while (v113);
              if (v114 != &v159)
              {
                if (v117 < (unint64_t)v82)
                  v115 = (uint64_t *)v116;
                if ((unint64_t)v82 >= v115[4])
                {
                  v118 = (v144 - v140) * v136 + (v145 - v141) * v142;
                  v119 = (v89 - v140) * v136 + v103 * v142;
                  v120 = v105 * v136 + v104 * v142;
                  v121 = v106 * v136 + (v99 - v141) * v142;
                  v122 = v138;
                  if (v118 < v138)
                    v122 = (v144 - v140) * v136 + (v145 - v141) * v142;
                  if (v119 < v122)
                    v122 = v119;
                  if (v120 < v122)
                    v122 = v120;
                  if (v121 >= v122)
                    v123 = v122;
                  else
                    v123 = v106 * v136 + (v99 - v141) * v142;
                  if (v118 <= v137)
                    v118 = v137;
                  if (v119 > v118)
                    v118 = v119;
                  if (v120 > v118)
                    v118 = v120;
                  if (v121 > v118)
                    v118 = v106 * v136 + (v99 - v141) * v142;
                  v137 = v118;
                  v138 = v123;
                }
              }
            }
          }
          v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v150, v177, 16);
        }
        while (v78);
      }
      else
      {
        v137 = -INFINITY;
        v138 = INFINITY;
        v146 = -INFINITY;
        v147 = INFINITY;
      }

      v124 = v141 + v138 * v142;
      v125 = v140 + v138 * v136;
      v182.x = (v124 + v147 * v139) / a4.width;
      v182.y = (v125 + v147 * v142) / a4.height;
      v126 = (void *)MEMORY[0x24BDBCE30];
      NSStringFromPoint(v182);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v183.y = (v125 + v146 * v142) / a4.height;
      v183.x = (v124 + v146 * v139) / a4.width;
      NSStringFromPoint(v183);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = v141 + v137 * v142;
      v130 = v140 + v137 * v136;
      v184.x = (v129 + v146 * v139) / a4.width;
      v184.y = (v130 + v146 * v142) / a4.height;
      NSStringFromPoint(v184);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v185.x = (v129 + v147 * v139) / a4.width;
      v185.y = (v130 + v147 * v142) / a4.height;
      NSStringFromPoint(v185);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "arrayWithObjects:", v127, v128, v131, v132, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    std::__tree<std::__value_type<CRTextFeature * {__strong},int>,std::__map_value_compare<CRTextFeature * {__strong},std::__value_type<CRTextFeature * {__strong},int>,std::less<CRTextFeature * {__strong}>,true>,std::allocator<std::__value_type<CRTextFeature * {__strong},int>>>::destroy(v159);
    if (v161)
    {
      v162 = (char *)v161;
      operator delete(v161);
    }
    if (__p)
    {
      v165 = (char *)__p;
      operator delete(__p);
    }
    if (v171)
    {
      v172 = v171;
      operator delete(v171);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isPointArrayARectangle:(uint64_t)a1
{
  id v2;
  NSString *v3;
  NSPoint v4;
  NSString *v5;
  NSPoint v6;
  NSString *v7;
  NSPoint v8;
  NSString *v9;
  NSPoint v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL8 v20;

  v2 = a2;
  objc_opt_self();
  if (objc_msgSend(v2, "count") != 4)
    goto LABEL_7;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 3);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = NSPointFromString(v3);

  objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = NSPointFromString(v5);

  objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = NSPointFromString(v7);

  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = NSPointFromString(v9);

  if (vabdd_f64(sqrt((v4.y - v6.y) * (v4.y - v6.y) + (v4.x - v6.x) * (v4.x - v6.x)), sqrt((v8.y - v10.y) * (v8.y - v10.y) + (v8.x - v10.x) * (v8.x - v10.x))) > 0.001)goto LABEL_7;
  v11 = v4.x - v10.x;
  v12 = v4.y - v10.y;
  v13 = sqrt(v12 * v12 + v11 * v11);
  if (vabdd_f64(v13, sqrt((v6.y - v8.y) * (v6.y - v8.y) + (v6.x - v8.x) * (v6.x - v8.x))) > 0.001)
    goto LABEL_7;
  v14 = v8.x - v6.x;
  v15 = v8.y - v6.y;
  v16 = sqrt(v15 * v15 + v14 * v14);
  if (fabs((v6.y - v4.y) * (v8.y - v6.y) + (v6.x - v4.x) * (v8.x - v6.x)) < sqrt((v6.y - v4.y) * (v6.y - v4.y)+ (v6.x - v4.x) * (v6.x - v4.x))* v16* 0.0000174532925&& (v17 = v10.x - v8.x, v18 = v10.y - v8.y, v19 = sqrt(v18 * v18 + v17 * v17), fabs(v15 * (v10.y - v8.y) + v14 * (v10.x - v8.x)) < v16 * v19 * 0.0000174532925))
  {
    v20 = fabs(v18 * v12 + v17 * v11) < v19 * v13 * 0.0000174532925;
  }
  else
  {
LABEL_7:
    v20 = 0;
  }

  return v20;
}

+ (BOOL)lineThroughPoint:(double)a3 andPoint:(double)a4 andRectangle:(double)a5 intersectAtPoint:(double)a6 andPoint:(double)a7
{
  unint64_t v21;
  int v22;
  double *v23;
  BOOL v24;
  unint64_t v25;
  __int128 v27;
  double v28;
  _QWORD v29[8];

  v29[7] = *MEMORY[0x24BDAC8D0];
  objc_opt_self();
  v21 = 0;
  v22 = 0;
  v23 = (double *)v29;
  v28 = a5;
  *(double *)v29 = a6;
  *(double *)&v29[1] = a5 + a7;
  *(double *)&v29[2] = a6;
  *(double *)&v29[3] = a5 + a7;
  *(double *)&v29[4] = a6 + a8;
  *(double *)&v29[5] = a5;
  *(double *)&v29[6] = a6 + a8;
  v24 = 1;
  while (1)
  {
    v25 = v21 + 1;
    if (objc_msgSend(MEMORY[0x24BEB5B78], "checkIntersectionForLineThroughPoint:andPoint:andSegmentStartingAt:andEndingAt:intersectAt:", &v27, a1, a2, a3, a4, *(v23 - 1), *v23, *(double *)&v29[2 * ((v21 + 1) & 3) - 1], *(double *)&v29[2 * ((v21 + 1) & 3)]))break;
LABEL_7:
    v24 = v21 < 3;
    v23 += 2;
    ++v21;
    if (v25 == 4)
      return 0;
  }
  if (!v22)
  {
    if (a10)
      *a10 = v27;
    v22 = 1;
    goto LABEL_7;
  }
  if (a11)
    *a11 = v27;
  return v24;
}

+ (id)boxInNormalizedSpace:(id)a3 toImageSpaceWithSize:(CGSize)a4 plusPadding:(CGPoint)a5 destSize:(CGSize *)a6 networkInputSize:(CGSize)a7
{
  double height;
  id v10;
  NSString *v11;
  NSPoint v12;
  NSString *v13;
  NSPoint v14;
  NSString *v15;
  NSPoint v16;
  NSString *v17;
  NSPoint v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __double2 v31;
  double v32;
  __double2 v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double x;
  double y;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  NSString *v52;
  NSPoint v53;
  NSString *v54;
  NSPoint v55;
  NSString *v56;
  NSPoint v57;
  NSString *v58;
  NSPoint v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  double v65;
  double v66;
  double v67;
  double *v68;
  double v69;
  double v70;
  CGFloat v71;
  CGFloat v72;
  void *v73;
  void *v74;
  CGFloat v75;
  CGFloat v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  NSString *v81;
  NSPoint v82;
  NSString *v83;
  NSPoint v84;
  NSString *v85;
  NSPoint v86;
  NSString *v87;
  NSPoint v88;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double aPoint;
  double aPointa;
  double aPointb;
  double aPoint_8;
  double aPoint_8a;
  double v108;
  double v109;
  double v110;
  double v111;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  void *__p[3];
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  NSPoint v124;
  NSPoint v125;
  NSPoint v126;
  NSPoint v127;
  NSPoint v128;
  NSPoint v129;
  NSPoint v130;
  NSPoint v131;
  NSPoint v132;
  NSPoint v133;
  NSPoint v134;
  NSPoint v135;

  height = a7.height;
  v10 = a3;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = NSPointFromString(v11);

  objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = NSPointFromString(v13);

  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  v16 = NSPointFromString(v15);

  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  v18 = NSPointFromString(v17);

  v19 = 0;
  v20 = a4.width * v12.x;
  v21 = a4.height * v12.y;
  v22 = a4.width * v14.x;
  v23 = a4.height * v14.y;
  v24 = sqrt((v21 - v23) * (v21 - v23) + (v20 - v22) * (v20 - v22));
  if (v24 != 0.0)
  {
    v25 = sqrt((v21 - a4.height * v18.y) * (v21 - a4.height * v18.y) + (v20 - a4.width * v18.x)
                                                                     * (v20 - a4.width * v18.x));
    if (v25 != 0.0)
    {
      a6->height = height;
      if (height - a5.y <= 0.0)
        goto LABEL_15;
      aPoint = a4.width * v18.x;
      aPoint_8 = a4.height * v18.y;
      v26 = v25 / (height - a5.y);
      v27 = a5.y * v26;
      v28 = INFINITY;
      if (a5.x < INFINITY)
      {
        v28 = a5.x * v26;
        a6->width = a5.x + v24 / v26;
      }
      v99 = v26;
      v110 = a4.width * v16.x;
      v113 = a4.height * v16.y;
      v115 = v28;
      v29 = atan2(v23 - v21, v22 - v20);
      v30 = v27 * -0.5;
      v31 = __sincos_stret(v29);
      v108 = v27 * -0.5 * v31.__sinval;
      v32 = v27 * 0.5;
      v101 = v32 * v31.__cosval;
      v33 = __sincos_stret(v29 + 3.14159265);
      v34 = v30 * v33.__sinval;
      v35 = v32 * v33.__cosval;
      if (v115 >= INFINITY)
      {
        v124.x = v20 + v34;
        v124.y = v21 + v35;
        v45 = (void *)MEMORY[0x24BDBCE30];
        NSStringFromPoint(v124);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v125.y = v23 + v32 * v33.__cosval;
        v125.x = v22 + v34;
        NSStringFromPoint(v125);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v126.x = v110 + v108;
        v126.y = v113 + v101;
        NSStringFromPoint(v126);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v127.x = aPoint + v108;
        v127.y = aPoint_8 + v101;
        NSStringFromPoint(v127);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "arrayWithObjects:", v46, v47, v48, v49, 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v51 = v50;
        objc_opt_self();
        objc_msgSend(v51, "objectAtIndex:", 0);
        v52 = (NSString *)objc_claimAutoreleasedReturnValue();
        v53 = NSPointFromString(v52);

        objc_msgSend(v51, "objectAtIndex:", 1);
        v54 = (NSString *)objc_claimAutoreleasedReturnValue();
        v55 = NSPointFromString(v54);

        objc_msgSend(v51, "objectAtIndex:", 2);
        v56 = (NSString *)objc_claimAutoreleasedReturnValue();
        v57 = NSPointFromString(v56);

        objc_msgSend(v51, "objectAtIndex:", 3);
        v58 = (NSString *)objc_claimAutoreleasedReturnValue();
        v59 = NSPointFromString(v58);

        v60 = objc_opt_self();
        if (!+[GeometricCutTools lineThroughPoint:andPoint:andRectangle:intersectAtPoint:andPoint:](v53.x, v53.y, v55.x, v55.y, 1.0, 1.0, a4.width + -2.0, a4.height + -2.0, v60, &v123, &v122))goto LABEL_12;
        v61 = objc_opt_self();
        if (+[GeometricCutTools lineThroughPoint:andPoint:andRectangle:intersectAtPoint:andPoint:](v57.x, v57.y, v59.x, v59.y, 1.0, 1.0, a4.width + -2.0, a4.height + -2.0, v61, &v121, &v120))
        {
          v109 = *((double *)&v123 + 1);
          v111 = *(double *)&v123;
          aPointb = *((double *)&v122 + 1);
          aPoint_8a = *(double *)&v122;
          v100 = *((double *)&v121 + 1);
          v102 = *(double *)&v121;
          v97 = *((double *)&v120 + 1);
          v98 = *(double *)&v120;
          std::vector<double>::vector(__p, 4uLL);
          v62 = sqrt((v55.y - v53.y) * (v55.y - v53.y) + (v55.x - v53.x) * (v55.x - v53.x));
          v63 = (v55.x - v53.x) / v62;
          v64 = (v55.y - v53.y) / v62;
          v65 = sqrt((v59.y - v53.y) * (v59.y - v53.y) + (v59.x - v53.x) * (v59.x - v53.x));
          v66 = v65 * ((v59.x - v53.x) / v65) * 0.5;
          v67 = v65 * ((v59.y - v53.y) / v65) * 0.5;
          v68 = (double *)__p[0];
          *(CGFloat *)__p[0] = v64 * (v109 - (v53.y + v67)) + (v111 - (v53.x + v66)) * v63;
          v68[1] = v64 * (aPointb - (v53.y + v67)) + (aPoint_8a - (v53.x + v66)) * v63;
          v68[2] = v64 * (v100 - (v53.y + v67)) + (v102 - (v53.x + v66)) * v63;
          v68[3] = v64 * (v97 - (v53.y + v67)) + (v98 - (v53.x + v66)) * v63;
          std::__sort<std::__less<double,double> &,double *>();
          v69 = *((double *)__p[0] + 1);
          v70 = *((double *)__p[0] + 2);
          v71 = v53.x + v66 + v69 * v63;
          v72 = v53.y + v67 + v69 * v64;
          v128.x = v71 - v66;
          v117 = v72;
          v128.y = v72 - v67;
          v73 = (void *)MEMORY[0x24BDBCE30];
          NSStringFromPoint(v128);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v53.x + v66 + v70 * v63;
          v76 = v53.y + v67 + v70 * v64;
          v129.y = v76 - v67;
          v129.x = v75 - v66;
          NSStringFromPoint(v129);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v130.x = v66 + v75;
          v130.y = v67 + v76;
          NSStringFromPoint(v130);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v131.x = v66 + v71;
          v131.y = v67 + v117;
          NSStringFromPoint(v131);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "arrayWithObjects:", v74, v77, v78, v79, 0);
          v80 = (id)objc_claimAutoreleasedReturnValue();

          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }
        else
        {
LABEL_12:
          v80 = v51;
        }

        objc_msgSend(v80, "objectAtIndexedSubscript:", 0);
        v81 = (NSString *)objc_claimAutoreleasedReturnValue();
        v82 = NSPointFromString(v81);
        x = v82.x;
        y = v82.y;

        objc_msgSend(v80, "objectAtIndexedSubscript:", 1);
        v83 = (NSString *)objc_claimAutoreleasedReturnValue();
        v84 = NSPointFromString(v83);
        v41 = v84.x;
        v42 = v84.y;

        objc_msgSend(v80, "objectAtIndexedSubscript:", 2);
        v85 = (NSString *)objc_claimAutoreleasedReturnValue();
        v86 = NSPointFromString(v85);
        v114 = v86.y;
        v116 = v86.x;

        objc_msgSend(v80, "objectAtIndexedSubscript:", 3);
        v87 = (NSString *)objc_claimAutoreleasedReturnValue();
        v88 = NSPointFromString(v87);
        aPointa = v88.x;
        v40 = v88.y;

        a6->width = sqrt((v84.y - v82.y) * (v84.y - v82.y) + (v84.x - v82.x) * (v84.x - v82.x)) / v99;
      }
      else
      {
        v36 = v115 * 0.5;
        v37 = v115 * 0.5 * v31.__cosval;
        v38 = v115 * 0.5 * v33.__cosval;
        v39 = v115 * 0.5 * v33.__sinval;
        aPointa = aPoint + v108 + v38;
        v40 = aPoint_8 + v101 + v39;
        v114 = v113 + v115 * 0.5 * v31.__sinval + v101;
        v116 = v110 + v37 + v108;
        v41 = v22 + v37 + v34;
        v42 = v23 + v36 * v31.__sinval + v35;
        x = v20 + v38 + v34;
        y = v21 + v39 + v35;
      }
      if (x >= 0.0)
      {
        v19 = 0;
        if (x < a4.width && y >= 0.0)
        {
          v19 = 0;
          if (y < a4.height && v41 >= 0.0)
          {
            v19 = 0;
            if (v41 < a4.width && v42 >= 0.0)
            {
              v19 = 0;
              if (v42 < a4.height && v116 >= 0.0)
              {
                v19 = 0;
                if (v116 < a4.width && v114 >= 0.0)
                {
                  v19 = 0;
                  if (v114 < a4.height && aPointa >= 0.0)
                  {
                    v19 = 0;
                    if (aPointa < a4.width && v40 >= 0.0 && v40 < a4.height)
                    {
                      v91 = (void *)MEMORY[0x24BDBCE30];
                      v132.x = x;
                      v132.y = y;
                      NSStringFromPoint(v132);
                      v92 = (void *)objc_claimAutoreleasedReturnValue();
                      v133.x = v41;
                      v133.y = v42;
                      NSStringFromPoint(v133);
                      v93 = (void *)objc_claimAutoreleasedReturnValue();
                      v134.y = v114;
                      v134.x = v116;
                      NSStringFromPoint(v134);
                      v94 = (void *)objc_claimAutoreleasedReturnValue();
                      v135.x = aPointa;
                      v135.y = v40;
                      NSStringFromPoint(v135);
                      v95 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v91, "arrayWithObjects:", v92, v93, v94, v95, 0);
                      v96 = (void *)objc_claimAutoreleasedReturnValue();

                      if (+[GeometricCutTools isPointArrayARectangle:]((uint64_t)a1, v96))
                        v19 = v96;
                      else
                        v19 = 0;

                    }
                  }
                }
              }
            }
          }
        }
      }
      else
      {
LABEL_15:
        v19 = 0;
      }
    }
  }

  return v19;
}

+ (BOOL)derotateContentsOf:(id)a3 inImage:(vImage_Buffer *)a4 andOutputTo:(vImage_Buffer *)a5 withPadding:(CGPoint)a6 networkInputSize:(CGSize)a7
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  void *v15;
  float v16;
  float v17;
  BOOL v18;
  double v20;
  int8x16_t v21;
  NSString *v22;
  NSPoint v23;
  NSString *v24;
  NSPoint v25;
  NSString *v26;
  NSPoint v27;
  vImagePixelCount v28;
  double v29;
  double v30;
  double v31;
  __double2 v32;
  __double2 v33;
  vImagePixelCount v34;
  vImagePixelCount v35;
  vImagePixelCount v36;
  double v37;
  double v38;
  double v39;
  char *v40;
  double v41;
  float64x2_t v42;

  height = a7.height;
  width = a7.width;
  y = a6.y;
  x = a6.x;
  v14 = a3;
  v42 = 0uLL;
  objc_msgSend(a1, "boxInNormalizedSpace:toImageSpaceWithSize:plusPadding:destSize:networkInputSize:", v14, &v42, (double)a4->width, (double)a4->height, x, y, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15
    && (v16 = v42.f64[0] * 0.125, v17 = (float)(ceilf(v16) * 8.0) + -5.0, v42.f64[0] = v17, width <= v17)
    && v17 <= (double)(4 * a4->width))
  {
    a5->data = malloc_type_malloc((int)v42.f64[1] * (int)v17, 0x100004077774924uLL);
    v20 = v42.f64[0];
    v21 = (int8x16_t)vcvtq_u64_f64(v42);
    *(int8x16_t *)&a5->height = vextq_s8(v21, v21, 8uLL);
    a5->rowBytes = (int)v20;
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    v23 = NSPointFromString(v22);

    objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    v25 = NSPointFromString(v24);

    objc_msgSend(v15, "objectAtIndexedSubscript:", 3);
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
    v27 = NSPointFromString(v26);

    v28 = a5->height;
    if (v28)
    {
      v29 = sqrt((v23.y - v27.y) * (v23.y - v27.y) + (v23.x - v27.x) * (v23.x - v27.x));
      v30 = sqrt((v23.y - v25.y) * (v23.y - v25.y) + (v23.x - v25.x) * (v23.x - v25.x));
      v31 = atan2(v25.y - v23.y, v25.x - v23.x);
      v32 = __sincos_stret(v31 + 1.57079633);
      v33 = __sincos_stret(v31);
      v34 = 0;
      v35 = a5->width;
      do
      {
        if (v35)
        {
          v36 = 0;
          v37 = v29 * (double)(int)v34 / (double)(v28 - 1);
          v38 = v23.y + v37 * v32.__sinval;
          v39 = v23.x + v37 * v32.__cosval;
          v40 = (char *)a5->data + a5->rowBytes * v34;
          do
          {
            v41 = v30 * (double)(int)v36 / (double)(v35 - 1);
            v40[v36++] = *((_BYTE *)a4->data
                         + a4->rowBytes * (int)(v38 + v41 * v33.__sinval)
                         + (int)(v39 + v41 * v33.__cosval));
            v35 = a5->width;
          }
          while (v35 > v36);
          v28 = a5->height;
        }
        ++v34;
      }
      while (v28 > v34);
    }
    v18 = 1;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)stringByInjectingSpaces:(id)a3 textFeatures:(id)a4 improved:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  float *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  uint64_t i;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  float v27;
  float *v28;
  float v29;
  uint64_t j;
  _QWORD *v31;
  int v32;
  float v33;
  uint64_t v34;
  int v35;
  uint64_t k;
  _QWORD *v37;
  _QWORD **v38;
  uint64_t v39;
  float v40;
  int v41;
  uint64_t m;
  _BYTE *v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  _DWORD *v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  int v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  _QWORD *v56;
  float v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  BOOL v61;
  float v62;
  int v63;
  uint64_t v64;
  float v65;
  _QWORD *v66;
  _QWORD *v67;
  _QWORD *v68;
  _QWORD *v69;
  _QWORD *v70;
  _QWORD *v71;
  _QWORD *v72;
  float v73;
  unsigned int v74;
  float v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  float v79;
  uint64_t n;
  double v81;
  _BYTE *v82;
  uint64_t v83;
  BOOL v84;
  int v85;
  _QWORD *v86;
  uint64_t v87;
  _QWORD *v88;
  _QWORD *v89;
  _QWORD *v90;
  _QWORD *v91;
  uint64_t v92;
  _QWORD *v93;
  BOOL v94;
  int v95;
  void *v96;
  unint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  _QWORD *v100;
  _QWORD *v101;
  float v102;
  float v103;
  _QWORD *v104;
  _QWORD *v105;
  _QWORD *v106;
  uint64_t v107;
  int v108;
  unint64_t v109;
  _QWORD *v110;
  _QWORD *v111;
  _QWORD *v112;
  _QWORD *v113;
  _QWORD *v114;
  _QWORD *v115;
  _QWORD *v116;
  float v117;
  uint64_t v118;
  BOOL v119;
  int v120;
  uint64_t v121;
  _QWORD *v122;
  _QWORD *v123;
  _QWORD *v124;
  _QWORD *v125;
  uint64_t v126;
  _QWORD *v127;
  uint64_t ii;
  _BYTE v130[4];
  _BOOL4 v131;
  _BYTE *v132;
  id v133;
  uint64_t v134;
  id v135;
  id v136;
  id v137;
  int v138;
  int v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  _BYTE v148[132];
  float v149;
  float v150;
  float v151;
  _BYTE v152[40];
  uint64_t v153;
  uint64_t v154;
  _BYTE v155[128];
  uint64_t v156;

  v5 = a5;
  v156 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v136 = v7;
  v137 = (id)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v8, "subFeatures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 < 3)
    goto LABEL_148;
  v135 = v8;
  objc_msgSend(v8, "subFeatures");
  v133 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "count");
  v132 = v130;
  MEMORY[0x24BDAC7A8]();
  v12 = (float *)&v130[-((v11 + 11) & 0xFFFFFFFFFFFFFFF0)];
  objc_msgSend(v8, "subFeatures");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  bzero(v12, 4 * objc_msgSend(v13, "count") - 1);

  v146 = 0u;
  v147 = 0u;
  v144 = 0u;
  v145 = 0u;
  objc_msgSend(v8, "subFeatures");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v144, v155, 16);
  if (!v15)
  {

    v138 = 0;
    v16 = 0;
LABEL_17:
    v27 = 0.0;
    goto LABEL_18;
  }
  v16 = 0;
  v17 = *(_QWORD *)v145;
  v18 = 0.0;
  v19 = 0.0;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v145 != v17)
        objc_enumerationMutation(v14);
      v21 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * i);
      if (v19 != 0.0)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v144 + 1) + 8 * i), "bounds");
        *(float *)&v22 = v22 - v19;
        *(float *)&v22 = fabsf(*(float *)&v22);
        v12[(int)v16] = *(float *)&v22;
        v16 = (v16 + 1);
        v18 = v18 + *(float *)&v22;
      }
      objc_msgSend(v21, "bounds");
      v24 = v23;
      objc_msgSend(v21, "bounds");
      v19 = v24 + v25;
    }
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v144, v155, 16);
  }
  while (v15);

  if ((int)v16 < 1)
  {
    v138 = 0;
    goto LABEL_17;
  }
  v26 = v16;
  v27 = 0.0;
  v28 = v12;
  do
  {
    v29 = *v28++;
    v27 = v27 + (float)((float)(v29 - (float)(v18 / (float)(int)v16)) * (float)(v29 - (float)(v18 / (float)(int)v16)));
    --v26;
  }
  while (v26);
  v138 = 1;
LABEL_18:
  v131 = v5;
  for (j = 0; j != 72; j += 24)
  {
    v31 = &v152[j];
    v31[2] = 0;
    *(_QWORD *)&v152[j + 8] = 0;
    *v31 = &v152[j + 8];
  }
  if ((int)v16 >= 0)
    v32 = v16;
  else
    v32 = v16 + 1;
  v33 = v12[(int)v16 - 1];
  v149 = *v12;
  v150 = v33;
  v151 = v12[v32 >> 1];
  v134 = v16;
  if ((int)v16 <= 1)
    v34 = 1;
  else
    v34 = v16;
  v35 = 10;
  do
  {
    v139 = v35;
    for (k = 0; k != 72; k += 24)
    {
      v37 = &v152[k];
      v38 = (_QWORD **)&v152[k + 8];
      std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*v38);
      *v37 = v38;
      v37[2] = 0;
      *v38 = 0;
    }
    if ((v138 & 1) != 0)
    {
      v39 = 0;
      v40 = v149;
      do
      {
        v41 = 0;
        for (m = 1; m != 3; ++m)
        {
          if ((float)((float)(v12[v39] - *(&v149 + m)) * (float)(v12[v39] - *(&v149 + m))) < (float)((float)(v12[v39] - v40) * (float)(v12[v39] - v40)))
            v41 = m;
        }
        v43 = &v152[24 * v41];
        v45 = v43 + 8;
        v44 = *((_QWORD *)v43 + 1);
        if (v44)
        {
          while (1)
          {
            while (1)
            {
              v46 = (_QWORD *)v44;
              v47 = *(int *)(v44 + 28);
              if (v39 >= v47)
                break;
              v44 = *v46;
              v45 = v46;
              if (!*v46)
                goto LABEL_43;
            }
            if (v39 <= v47)
              break;
            v44 = v46[1];
            if (!v44)
            {
              v45 = v46 + 1;
              goto LABEL_43;
            }
          }
        }
        else
        {
          v46 = v43 + 8;
LABEL_43:
          v48 = operator new(0x20uLL);
          v48[7] = v39;
          *(_QWORD *)v48 = 0;
          *((_QWORD *)v48 + 1) = 0;
          *((_QWORD *)v48 + 2) = v46;
          *v45 = v48;
          v49 = **(_QWORD **)v43;
          if (v49)
          {
            *(_QWORD *)v43 = v49;
            v48 = (_DWORD *)*v45;
          }
          std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)v43 + 1), (uint64_t *)v48);
          ++*((_QWORD *)v43 + 2);
        }
        ++v39;
      }
      while (v39 != v34);
    }
    v50 = 0;
    v51 = 0;
    v52 = v139;
    do
    {
      v53 = &v152[24 * v50];
      v56 = (_QWORD *)*v53;
      v54 = v53 + 1;
      v55 = v56;
      v57 = 0.0;
      if (v56 != v54)
      {
        do
        {
          v58 = (_QWORD *)v55[1];
          v59 = v55;
          if (v58)
          {
            do
            {
              v60 = v58;
              v58 = (_QWORD *)*v58;
            }
            while (v58);
          }
          else
          {
            do
            {
              v60 = (_QWORD *)v59[2];
              v61 = *v60 == (_QWORD)v59;
              v59 = v60;
            }
            while (!v61);
          }
          v57 = v57 + v12[*((int *)v55 + 7)];
          v55 = v60;
        }
        while (v60 != v54);
      }
      v62 = v57 / (float)*(unint64_t *)&v152[24 * v50 + 16];
      if (vabds_f32(v62, *(&v149 + v50)) > 0.00000011921)
      {
        *(&v149 + v50) = v62;
        v51 = 1;
      }
      ++v50;
    }
    while (v50 != 3);
    v84 = v52 != 0;
    v35 = v52 - 1;
    v63 = v35 != 0 && v84;
  }
  while ((v51 & v63 & 1) != 0);
  v64 = 0;
  v65 = 0.0;
  do
  {
    v66 = &v152[24 * v64];
    v69 = (_QWORD *)*v66;
    v67 = v66 + 1;
    v68 = v69;
    if (v69 != v67)
    {
      do
      {
        v70 = (_QWORD *)v68[1];
        v71 = v68;
        if (v70)
        {
          do
          {
            v72 = v70;
            v70 = (_QWORD *)*v70;
          }
          while (v70);
        }
        else
        {
          do
          {
            v72 = (_QWORD *)v71[2];
            v61 = *v72 == (_QWORD)v71;
            v71 = v72;
          }
          while (!v61);
        }
        v73 = v12[*((int *)v68 + 7)] - *(&v149 + v64);
        v65 = v65 + (float)(v73 * v73);
        v68 = v72;
      }
      while (v72 != v67);
    }
    ++v64;
  }
  while (v64 != 3);
  v74 = v153 && v150 > v149;
  if (v154 && v151 > *(&v149 + v74))
    v74 = 2;
  v75 = v27 - v65;
  if (v131)
  {
    v142 = 0u;
    v143 = 0u;
    v140 = 0u;
    v141 = 0u;
    objc_msgSend(v135, "subFeatures");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v140, v148, 16);
    if (v77)
    {
      v78 = *(_QWORD *)v141;
      v79 = 0.0;
      do
      {
        for (n = 0; n != v77; ++n)
        {
          if (*(_QWORD *)v141 != v78)
            objc_enumerationMutation(v76);
          objc_msgSend(*(id *)(*((_QWORD *)&v140 + 1) + 8 * n), "bounds");
          v79 = v81 + v79;
        }
        v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v140, v148, 16);
      }
      while (v77);
    }
    else
    {
      v79 = 0.0;
    }

    v95 = v134;
    objc_msgSend(v135, "subFeatures");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "count");

    v98 = v74;
    v99 = &v152[24 * v74];
    v101 = v99 + 1;
    v100 = (_QWORD *)*v99;
    v102 = 0.0;
    v103 = 0.0;
    if ((_QWORD *)*v99 != v99 + 1)
    {
      do
      {
        v104 = (_QWORD *)v100[1];
        v105 = v100;
        if (v104)
        {
          do
          {
            v106 = v104;
            v104 = (_QWORD *)*v104;
          }
          while (v104);
        }
        else
        {
          do
          {
            v106 = (_QWORD *)v105[2];
            v61 = *v106 == (_QWORD)v105;
            v105 = v106;
          }
          while (!v61);
        }
        v103 = v103 + v12[*((int *)v100 + 7)];
        v100 = v106;
      }
      while (v106 != v101);
    }
    v107 = 0;
    v108 = 0;
    v109 = v99[2];
    do
    {
      if (v107 != v98)
      {
        v110 = &v152[24 * v107];
        v113 = (_QWORD *)*v110;
        v111 = v110 + 1;
        v112 = v113;
        if (v113 != v111)
        {
          do
          {
            v114 = (_QWORD *)v112[1];
            v115 = v112;
            if (v114)
            {
              do
              {
                v116 = v114;
                v114 = (_QWORD *)*v114;
              }
              while (v114);
            }
            else
            {
              do
              {
                v116 = (_QWORD *)v115[2];
                v61 = *v116 == (_QWORD)v115;
                v115 = v116;
              }
              while (!v61);
            }
            v102 = v102 + v12[*((int *)v112 + 7)];
            ++v108;
            v112 = v116;
          }
          while (v116 != v111);
        }
      }
      ++v107;
    }
    while (v107 != 3);
    v117 = v103 / (float)v109;
    if (v117 >= (float)((float)(v102 / (float)v108) + (float)(v102 / (float)v108))
      && (float)(v79 / (float)v97) * 0.3 < v117)
    {
      v118 = v95;
      v119 = (float)(v75 / v27) <= 0.5 || v109 >= v95;
      v120 = v138;
      if (v119)
        v120 = 0;
      if (v120 == 1)
      {
        do
        {
          v121 = v118 - 1;
          v122 = (_QWORD *)*v101;
          if (*v101)
          {
            v123 = v101;
            do
            {
              v124 = v122;
              v125 = v123;
              v126 = *((int *)v122 + 7);
              v127 = v122 + 1;
              if (v121 <= v126)
              {
                v127 = v124;
                v123 = v124;
              }
              v122 = (_QWORD *)*v127;
            }
            while (v122);
            if (v123 != v101)
            {
              if (v121 > v126)
                v124 = v125;
              if (v118 > *((int *)v124 + 7))
                objc_msgSend(v137, "insertString:atIndex:", CFSTR(" "), v118);
            }
          }
          v94 = v118-- <= 1;
        }
        while (!v94);
      }
    }
  }
  else
  {
    v82 = &v152[24 * v74];
    v83 = (int)v134;
    v84 = v75 <= 0.0001 || *((_QWORD *)v82 + 2) >= (unint64_t)(int)v134;
    v85 = v138;
    if (v84)
      v85 = 0;
    if (v85 == 1)
    {
      v86 = v82 + 8;
      do
      {
        v87 = v83 - 1;
        v88 = (_QWORD *)*v86;
        if (*v86)
        {
          v89 = v86;
          do
          {
            v90 = v88;
            v91 = v89;
            v92 = *((int *)v88 + 7);
            v93 = v88 + 1;
            if (v87 <= v92)
            {
              v93 = v90;
              v89 = v90;
            }
            v88 = (_QWORD *)*v93;
          }
          while (v88);
          if (v89 != v86)
          {
            if (v87 > v92)
              v90 = v91;
            if (v83 > *((int *)v90 + 7))
              objc_msgSend(v137, "insertString:atIndex:", CFSTR(" "), v83);
          }
        }
        v94 = v83-- <= 1;
      }
      while (!v94);
    }
  }
  for (ii = 56; ii != -16; ii -= 24)
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(*(_QWORD **)&v152[ii]);

  v8 = v135;
LABEL_148:

  return v137;
}

+ (id)geometricRecognitionOf:(id)a3 inDerotatedRegion:(vImage_Buffer *)a4 withPadding:(CGPoint)a5 fromCorrectedBoundingBox:(id)a6 inImageWithSize:(CGSize)a7 withNetwork:(void *)a8 activations:()vector<std:(std:(BOOL)a10 :allocator<std::vector<std::vector<float>>>> *)a9 :vector<std::vector<float>> invert:
{
  _BOOL8 v10;
  double height;
  double width;
  double y;
  double x;
  id v20;
  id v21;
  __int128 v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[3];
  _OWORD v27[2];
  void **v28;

  v10 = a10;
  height = a7.height;
  width = a7.width;
  y = a5.y;
  x = a5.x;
  v20 = a3;
  v21 = a6;
  v22 = *(_OWORD *)&a4->width;
  v27[0] = *(_OWORD *)&a4->data;
  v27[1] = v22;
  v23 = *((_QWORD *)a8 + 21);
  memset(v26, 0, sizeof(v26));
  std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v26, (uint64_t *)a9->var0, (uint64_t *)a9->var1, 0xAAAAAAAAAAAAAAABLL * (((char *)a9->var1 - (char *)a9->var0) >> 3));
  objc_msgSend(a1, "geometricRecognitionOf:inDerotatedRegion:withPadding:fromCorrectedBoundingBox:inImageWithSize:withCodeMap:activations:invert:networkInputSize:", v20, v27, v21, v23, v26, v10, x, y, width, height, (double)*((int *)a8 + 25), (double)*((int *)a8 + 26));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void **)v26;
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v28);

  return v24;
}

+ (id)geometricRecognitionOf:(id)a3 inDerotatedRegion:(vImage_Buffer *)a4 withPadding:(CGPoint)a5 fromCorrectedBoundingBox:(id)a6 inImageWithSize:(CGSize)a7 withCodeMap:(const int *)a8 activations:()vector<std:(std:(BOOL)a10 :(CGSize)a11 allocator<std::vector<std::vector<float>>>> *)a9 :vector<std::vector<float>> invert:networkInputSize:
{
  _BOOL8 v11;
  double height;
  double width;
  double v17;
  double v18;
  double y;
  double x;
  id v22;
  void *v23;
  NSString *v24;
  NSPoint v25;
  NSString *v26;
  NSPoint v27;
  unint64_t v28;
  uint64_t *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *var0;
  float v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  float v42;
  float *v43;
  float **v44;
  unint64_t v45;
  _QWORD *v46;
  float *v47;
  float *v48;
  uint64_t v49;
  unint64_t v50;
  _BOOL8 v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  float *v56;
  int v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  void *v61;
  uint64_t v62;
  double v63;
  uint64_t v64;
  uint64_t i;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  uint64_t *v76;
  uint64_t *v77;
  double v78;
  double v79;
  double v80;
  unint64_t v81;
  int v82;
  int v83;
  unsigned int v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  double v88;
  std::vector<int>::pointer v89;
  std::vector<int>::pointer begin;
  std::vector<int>::pointer v91;
  double v92;
  double v93;
  double *v94;
  BOOL v95;
  _BYTE *v96;
  double *v97;
  double v98;
  double v99;
  double *v100;
  BOOL v101;
  _BYTE *v102;
  double *v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t *v109;
  uint64_t v110;
  unint64_t v111;
  std::vector<int>::pointer v112;
  uint64_t *v113;
  float *v114;
  float *v115;
  float *v116;
  BOOL v117;
  float *v118;
  float v119;
  float *v120;
  float v121;
  float v122;
  id v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  id v130;
  uint64_t v131;
  id v132;
  uint64_t v133;
  id v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v154;
  const int *v155;
  id v156;
  double v157;
  double v158;
  void *v159;
  double v160;
  void *v161;
  double v162;
  void *v163;
  double v164;
  void *v165;
  id v166;
  id v167;
  id obj;
  id obja;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  uint64_t v174;
  void *v175;
  unint64_t v176;
  void *v177;
  void *v178;
  void *v180;
  _QWORD v181[4];
  id v182;
  _QWORD v183[4];
  id v184;
  _QWORD v185[4];
  id v186;
  __int16 v187;
  __int16 v188;
  uint64_t v189;
  void *__p;
  char *v191;
  void *v192;
  char *v193;
  std::vector<int> v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  uint64_t *v199;
  uint64_t *v200;
  uint64_t v201;
  _BYTE v202[16];
  const int *v203;
  _BYTE v204[128];
  uint64_t v205;

  v11 = a10;
  height = a11.height;
  width = a11.width;
  v17 = a7.height;
  v18 = a7.width;
  y = a5.y;
  x = a5.x;
  v205 = *MEMORY[0x24BDAC8D0];
  v156 = a3;
  v22 = a6;
  v203 = a8;
  if (width <= (double)a4->width)
  {
    v162 = v18;
    v164 = v17;
    objc_msgSend(a1, "boxInNormalizedSpace:toImageSpaceWithSize:plusPadding:destSize:networkInputSize:", v22, v202, v18, v17, x, y, width, height);
    v154 = (void *)objc_claimAutoreleasedReturnValue();

    if (v154)
    {
      objc_msgSend(v154, "objectAtIndexedSubscript:", 0);
      v24 = (NSString *)objc_claimAutoreleasedReturnValue();
      v25 = NSPointFromString(v24);

      objc_msgSend(v154, "objectAtIndexedSubscript:", 1);
      v26 = (NSString *)objc_claimAutoreleasedReturnValue();
      v27 = NSPointFromString(v26);

      v200 = 0;
      v201 = 0;
      v199 = 0;
      v28 = 0xAAAAAAAAAAAAAAABLL * (((char *)a9->var1 - (char *)a9->var0) >> 3);
      v29 = *(uint64_t **)a9->var0;
      v30 = -1431655765 * ((uint64_t)(*((_QWORD *)a9->var0 + 1) - (_QWORD)v29) >> 3);
      if ((int)v28 < 2)
      {
        std::vector<std::vector<float>>::resize((uint64_t *)&v199, v30);
        if (v30 >= 1)
        {
          v58 = 0;
          v59 = 24 * v30;
          do
          {
            v60 = *(uint64_t **)a9->var0;
            if (v199 != v60)
              std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&v199[v58 / 8], (char *)v60[v58 / 8], v60[v58 / 8 + 1], (v60[v58 / 8 + 1] - v60[v58 / 8]) >> 2);
            v58 += 24;
          }
          while (v59 != v58);
        }
      }
      else
      {
        v32 = *v29;
        v31 = v29[1];
        std::vector<std::vector<float>>::resize((uint64_t *)&v199, v30);
        if (v30 >= 1)
        {
          v33 = 0;
          v34 = (float)(int)v28;
          v174 = v30;
          v176 = (unint64_t)(v31 - v32) >> 2;
          v35 = v28;
          v155 = a8;
          do
          {
            if ((int)v176 >= 1)
            {
              v36 = 0;
              do
              {
                var0 = (uint64_t *)a9->var0;
                v38 = 0.0;
                v39 = v35;
                do
                {
                  v40 = *var0;
                  var0 += 3;
                  v38 = v38 + *(float *)(*(_QWORD *)(v40 + 24 * v33) + 4 * v36);
                  --v39;
                }
                while (v39);
                v41 = &v199[3 * v33];
                v42 = v38 / v34;
                v44 = (float **)(v41 + 1);
                v43 = (float *)v41[1];
                v46 = v41 + 2;
                v45 = v41[2];
                if ((unint64_t)v43 >= v45)
                {
                  v48 = (float *)*v41;
                  v49 = ((uint64_t)v43 - *v41) >> 2;
                  v50 = v49 + 1;
                  if ((unint64_t)(v49 + 1) >> 62)
                    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
                  v51 = v11;
                  v52 = v35;
                  v53 = v45 - (_QWORD)v48;
                  if (v53 >> 1 > v50)
                    v50 = v53 >> 1;
                  if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFFCLL)
                    v54 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v54 = v50;
                  if (v54)
                  {
                    v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v46, v54);
                    v43 = *v44;
                    v48 = (float *)*v41;
                  }
                  else
                  {
                    v55 = 0;
                  }
                  v56 = (float *)&v55[4 * v49];
                  *v56 = v42;
                  v47 = v56 + 1;
                  while (v43 != v48)
                  {
                    v57 = *((_DWORD *)v43-- - 1);
                    *((_DWORD *)v56-- - 1) = v57;
                  }
                  *v41 = (uint64_t)v56;
                  *v44 = v47;
                  *v46 = &v55[4 * v54];
                  if (v48)
                    operator delete(v48);
                  v35 = v52;
                  v11 = v51;
                  a8 = v155;
                }
                else
                {
                  *v43 = v42;
                  v47 = v43 + 1;
                }
                *v44 = v47;
                ++v36;
              }
              while (v36 != v176);
            }
            ++v33;
          }
          while (v33 != v174);
        }
      }
      if (v11)
        std::__reverse[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<std::vector<float> *>,std::__wrap_iter<std::vector<float> *>>(v199, v200);
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      v197 = 0u;
      v198 = 0u;
      v195 = 0u;
      v196 = 0u;
      objc_msgSend(v156, "subFeatures");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v195, v204, 16);
      v170 = v61;
      if (v62)
      {
        v63 = sqrt((v27.y - v25.y) * (v27.y - v25.y) + (v27.x - v25.x) * (v27.x - v25.x));
        v158 = (v27.y - v25.y) / v63;
        v160 = (v27.x - v25.x) / v63;
        v64 = *(_QWORD *)v196;
        v157 = width * 0.5;
        do
        {
          for (i = 0; i != v62; ++i)
          {
            if (*(_QWORD *)v196 != v64)
              objc_enumerationMutation(obj);
            v66 = *(void **)(*((_QWORD *)&v195 + 1) + 8 * i);
            objc_msgSend(v66, "bounds");
            v68 = v67;
            objc_msgSend(v66, "bounds");
            v70 = v69;
            objc_msgSend(v66, "bounds");
            v72 = v71;
            objc_msgSend(v66, "bounds");
            v74 = 0.0;
            if (v63 > width)
            {
              v75 = (v158 * (v164 * (v72 + v73 * 0.5) - v25.y) + (v162 * (v68 + v70 * 0.5) - v25.x) * v160 - v157)
                  / (v63 - width);
              if (v75 >= 0.0)
              {
                v74 = (v158 * (v164 * (v72 + v73 * 0.5) - v25.y) + (v162 * (v68 + v70 * 0.5) - v25.x) * v160 - v157)
                    / (v63 - width);
                if (v75 > 1.0)
                  v74 = 1.0;
              }
            }
            v77 = v199;
            v76 = v200;
            objc_msgSend(v66, "bounds");
            v79 = v78;
            v80 = 1.0;
            if (x != INFINITY)
              objc_msgSend(v156, "bounds");
            v81 = 0xAAAAAAAAAAAAAAABLL * (v76 - v77);
            v82 = (int)(v74 * (double)(v81 - 1));
            v83 = (int)(v79 * (double)v81 / v80);
            if (v83 <= 1)
              v84 = 1;
            else
              v84 = v83;
            v85 = (v199[3 * v82 + 1] - v199[3 * v82]) >> 2;
            v192 = 0;
            std::vector<double>::vector(&v194, v85, &v192);
            v86 = (v199[3 * v82 + 1] - v199[3 * v82]) >> 2;
            __p = 0;
            std::vector<double>::vector(&v192, v86, &__p);
            v87 = (v199[3 * v82 + 1] - v199[3 * v82]) >> 2;
            v189 = 0;
            std::vector<double>::vector(&__p, v87, &v189);
            v61 = v170;
            fieldDecoding((uint64_t *)&v199, v84, v82, &v203, 1, &v194, v170, v11);
            fieldDecoding((uint64_t *)&v199, v84, v82, &v203, 2, &v192, v177, v11);
            fieldDecoding((uint64_t *)&v199, v84, v82, &v203, 3, &__p, v180, v11);
            if (v194.__begin_ == v194.__end_)
            {
              begin = v194.__begin_;
            }
            else
            {
              v89 = v194.__begin_ + 2;
              begin = v194.__begin_;
              if (v194.__begin_ + 2 != v194.__end_)
              {
                v88 = *(double *)v194.__begin_;
                begin = v194.__begin_;
                v91 = v194.__begin_ + 2;
                do
                {
                  v92 = *(double *)v91;
                  v91 += 2;
                  v93 = v92;
                  if (v88 < v92)
                  {
                    v88 = v93;
                    begin = v89;
                  }
                  v89 = v91;
                }
                while (v91 != v194.__end_);
              }
            }
            v94 = (double *)((char *)v192 + 8);
            v95 = v192 == v193 || v94 == (double *)v193;
            v96 = v192;
            if (!v95)
            {
              v88 = *(double *)v192;
              v96 = v192;
              v97 = (double *)((char *)v192 + 8);
              do
              {
                v98 = *v97++;
                v99 = v98;
                if (v88 < v98)
                {
                  v88 = v99;
                  v96 = v94;
                }
                v94 = v97;
              }
              while (v97 != (double *)v193);
            }
            v100 = (double *)((char *)__p + 8);
            v101 = __p == v191 || v100 == (double *)v191;
            v102 = __p;
            if (!v101)
            {
              v88 = *(double *)__p;
              v102 = __p;
              v103 = (double *)((char *)__p + 8);
              do
              {
                v104 = *v103++;
                v105 = v104;
                if (v88 < v104)
                {
                  v88 = v105;
                  v102 = v100;
                }
                v100 = v103;
              }
              while (v103 != (double *)v191);
            }
            LOWORD(v189) = *(const int *)((char *)a8 + (((char *)begin - (char *)v194.__begin_) << 29 >> 30));
            v188 = *(const int *)((char *)a8 + ((v96 - (_BYTE *)v192) << 29 >> 30));
            v187 = *(const int *)((char *)a8 + ((v102 - (_BYTE *)__p) << 29 >> 30));
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v189, 1, v88);
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v175, "appendString:", v106);

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v188, 1);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v173, "appendString:", v107);

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v187, 1);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v172, "appendString:", v108);

            if (__p)
            {
              v191 = (char *)__p;
              operator delete(__p);
            }
            if (v192)
            {
              v193 = (char *)v192;
              operator delete(v192);
            }
            if (v194.__begin_)
            {
              v194.__end_ = v194.__begin_;
              operator delete(v194.__begin_);
            }
          }
          v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v195, v204, 16);
        }
        while (v62);
      }

      std::vector<int>::vector(&v194, 0xAAAAAAAAAAAAAAABLL * (v200 - v199));
      v109 = v199;
      if (v200 != v199)
      {
        v110 = 0;
        v111 = ((char *)v200 - (char *)v199) / 24;
        v112 = v194.__begin_;
        if (v111 <= 1)
          v111 = 1;
        do
        {
          v113 = &v109[3 * v110];
          v114 = (float *)*v113;
          v115 = (float *)v113[1];
          v116 = v114 + 1;
          v117 = v114 == v115 || v116 == v115;
          v118 = v114;
          if (!v117)
          {
            v119 = *v114;
            v118 = v114;
            v120 = v114 + 1;
            do
            {
              v121 = *v120++;
              v122 = v121;
              if (v119 < v121)
              {
                v119 = v122;
                v118 = v116;
              }
              v116 = v120;
            }
            while (v120 != v115);
          }
          v112[v110++] = *(const int *)((char *)a8 + (((char *)v118 - (char *)v114) << 30 >> 30));
        }
        while (v110 != v111);
      }
      +[GeometricCutTools stringByInjectingSpaces:textFeatures:improved:](GeometricCutTools, "stringByInjectingSpaces:textFeatures:improved:", v175, v156, 0);
      v123 = (id)objc_claimAutoreleasedReturnValue();
      +[GeometricCutTools stringByInjectingSpaces:textFeatures:improved:](GeometricCutTools, "stringByInjectingSpaces:textFeatures:improved:", v173, v156, 0);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      +[GeometricCutTools stringByInjectingSpaces:textFeatures:improved:](GeometricCutTools, "stringByInjectingSpaces:textFeatures:improved:", v172, v156, 0);
      v125 = objc_claimAutoreleasedReturnValue();
      v126 = (void *)v125;
      if (v11)
      {
        v165 = v123;
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", objc_msgSend(v123, "length"));
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", objc_msgSend(v124, "length"));
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", objc_msgSend(v126, "length"));
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = v123;
        v128 = objc_msgSend(v123, "length");
        v129 = MEMORY[0x24BDAC760];
        v185[0] = MEMORY[0x24BDAC760];
        v185[1] = 3221225472;
        v185[2] = __163__GeometricCutTools_geometricRecognitionOf_inDerotatedRegion_withPadding_fromCorrectedBoundingBox_inImageWithSize_withCodeMap_activations_invert_networkInputSize___block_invoke;
        v185[3] = &unk_24C58B4A8;
        v130 = v159;
        v186 = v130;
        objc_msgSend(v127, "enumerateSubstringsInRange:options:usingBlock:", 0, v128, 258, v185);
        v131 = objc_msgSend(v124, "length");
        v183[0] = v129;
        v183[1] = 3221225472;
        v183[2] = __163__GeometricCutTools_geometricRecognitionOf_inDerotatedRegion_withPadding_fromCorrectedBoundingBox_inImageWithSize_withCodeMap_activations_invert_networkInputSize___block_invoke_2;
        v183[3] = &unk_24C58B4A8;
        v132 = v163;
        v184 = v132;
        objc_msgSend(v124, "enumerateSubstringsInRange:options:usingBlock:", 0, v131, 258, v183);
        v133 = objc_msgSend(v126, "length");
        v181[0] = v129;
        v181[1] = 3221225472;
        v181[2] = __163__GeometricCutTools_geometricRecognitionOf_inDerotatedRegion_withPadding_fromCorrectedBoundingBox_inImageWithSize_withCodeMap_activations_invert_networkInputSize___block_invoke_3;
        v181[3] = &unk_24C58B4A8;
        v134 = v161;
        v182 = v134;
        objc_msgSend(v126, "enumerateSubstringsInRange:options:usingBlock:", 0, v133, 258, v181);
        v123 = v130;

        v167 = v132;
        v166 = v134;

        objc_msgSend(v61, "reverseObjectEnumerator");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "allObjects");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        obja = (id)objc_msgSend(v136, "mutableCopy");

        objc_msgSend(v177, "reverseObjectEnumerator");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "allObjects");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        v171 = (void *)objc_msgSend(v138, "mutableCopy");

        objc_msgSend(v180, "reverseObjectEnumerator");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "allObjects");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        v141 = objc_msgSend(v140, "mutableCopy");

        v180 = (void *)v141;
      }
      else
      {
        obja = v61;
        v171 = v177;
        v166 = (id)v125;
        v167 = v124;
      }
      v142 = (void *)MEMORY[0x24BDBCE70];
      v143 = (void *)MEMORY[0x24BDBCE30];
      v178 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v123);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0xAAAAAAAAAAAAAAABLL * (v200 - v199));
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "arrayWithObjects:", v178, obja, v144, 0);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = (void *)MEMORY[0x24BDBCE30];
      v147 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v167);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0xAAAAAAAAAAAAAAABLL * (v200 - v199));
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "arrayWithObjects:", v147, v171, v148, 0);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v150 = (void *)MEMORY[0x24BDBCE30];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0xAAAAAAAAAAAAAAABLL * (v200 - v199));
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "arrayWithObjects:", v166, v180, v151, 0);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "dictionaryWithObjectsAndKeys:", v145, CFSTR("CardNumber"), v149, CFSTR("Cardholder"), v152, CFSTR("Expiration"), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v194.__begin_)
      {
        v194.__end_ = v194.__begin_;
        operator delete(v194.__begin_);
      }

      v194.__begin_ = (std::vector<int>::pointer)&v199;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v194);
    }
    else
    {
      v23 = 0;
    }
    v22 = v154;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

uint64_t __163__GeometricCutTools_geometricRecognitionOf_inDerotatedRegion_withPadding_fromCorrectedBoundingBox_inImageWithSize_withCodeMap_activations_invert_networkInputSize___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __163__GeometricCutTools_geometricRecognitionOf_inDerotatedRegion_withPadding_fromCorrectedBoundingBox_inImageWithSize_withCodeMap_activations_invert_networkInputSize___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __163__GeometricCutTools_geometricRecognitionOf_inDerotatedRegion_withPadding_fromCorrectedBoundingBox_inImageWithSize_withCodeMap_activations_invert_networkInputSize___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

+ (id)geometricRecognitionOf:(id)a3 inDerotatedRegion:(vImage_Buffer *)a4 withPadding:(CGPoint)a5 fromCorrectedBoundingBox:(id)a6 inImageWithSize:(CGSize)a7 withNetwork:(void *)a8 activations:()vector<std:(std:(BOOL)a10 :(unsigned __int16)a11 allocator<std::vector<std::vector<float>>>> *)a9 :vector<std::vector<float>> invert:garbageSymbol:
{
  _BOOL8 v11;
  double height;
  double width;
  double y;
  double x;
  id v21;
  id v22;
  __int128 v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  _QWORD v28[3];
  _OWORD v29[2];
  void **v30;

  v11 = a10;
  height = a7.height;
  width = a7.width;
  y = a5.y;
  x = a5.x;
  v21 = a3;
  v22 = a6;
  v23 = *(_OWORD *)&a4->width;
  v29[0] = *(_OWORD *)&a4->data;
  v29[1] = v23;
  v24 = *((_QWORD *)a8 + 21);
  memset(v28, 0, sizeof(v28));
  std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v28, (uint64_t *)a9->var0, (uint64_t *)a9->var1, 0xAAAAAAAAAAAAAAABLL * (((char *)a9->var1 - (char *)a9->var0) >> 3));
  LOWORD(v27) = a11;
  objc_msgSend(a1, "geometricRecognitionOf:inDerotatedRegion:withPadding:fromCorrectedBoundingBox:inImageWithSize:withCodeMap:activations:invert:networkInputSize:garbageSymbol:", v21, v29, v22, v24, v28, v11, x, y, width, height, (double)*((int *)a8 + 25), (double)*((int *)a8 + 26), v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void **)v28;
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v30);

  return v25;
}

+ (id)geometricRecognitionOf:(id)a3 inDerotatedRegion:(vImage_Buffer *)a4 withPadding:(CGPoint)a5 fromCorrectedBoundingBox:(id)a6 inImageWithSize:(CGSize)a7 withCodeMap:(const int *)a8 activations:()vector<std:(std:(BOOL)a10 :(CGSize)a11 allocator<std:(unsigned __int16)a12 :vector<std::vector<float>>>> *)a9 :vector<std::vector<float>> invert:networkInputSize:garbageSymbol:
{
  double height;
  double width;
  double v17;
  double v18;
  double y;
  double x;
  id v22;
  void *v23;
  NSString *v24;
  NSPoint v25;
  NSString *v26;
  NSPoint v27;
  unint64_t v28;
  uint64_t *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *var0;
  float v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  float v42;
  float *v43;
  float **v44;
  unint64_t v45;
  _QWORD *v46;
  float *v47;
  float *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  float *v54;
  int v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  void *v59;
  uint64_t v60;
  double v61;
  void *v62;
  uint64_t i;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  uint64_t *v74;
  uint64_t *v75;
  double v76;
  double v77;
  double v78;
  unint64_t v79;
  int v80;
  int v81;
  unsigned int v82;
  unint64_t v83;
  unint64_t v84;
  int v85;
  int v86;
  unint64_t v87;
  void *v88;
  double v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  int v97;
  void *v98;
  void *v99;
  std::vector<int>::pointer v100;
  std::vector<int>::pointer begin;
  std::vector<int>::pointer v102;
  double v103;
  double v104;
  void *v105;
  uint64_t *v106;
  uint64_t v107;
  unint64_t v108;
  std::vector<int>::pointer v109;
  uint64_t *v110;
  float *v111;
  float *v112;
  float *v113;
  BOOL v114;
  float *v115;
  float v116;
  float *v117;
  float v118;
  float v119;
  void *v120;
  std::vector<int>::pointer v121;
  unint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  id v128;
  id v129;
  _BOOL4 v131;
  void *v132;
  id v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  void *v146;
  _QWORD v147[4];
  id v148;
  uint64_t v149;
  std::vector<int> __p;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  uint64_t *v155;
  uint64_t *v156;
  uint64_t v157;
  _BYTE v158[16];
  _BYTE v159[128];
  uint64_t v160;

  v131 = a10;
  height = a11.height;
  width = a11.width;
  v17 = a7.height;
  v18 = a7.width;
  y = a5.y;
  x = a5.x;
  v160 = *MEMORY[0x24BDAC8D0];
  v133 = a3;
  v22 = a6;
  if (width <= (double)a4->width)
  {
    v137 = v18;
    v138 = v17;
    objc_msgSend(a1, "boxInNormalizedSpace:toImageSpaceWithSize:plusPadding:destSize:networkInputSize:", v22, v158, v18, v17, x, y, width, height);
    v132 = (void *)objc_claimAutoreleasedReturnValue();

    if (v132)
    {
      objc_msgSend(v132, "objectAtIndexedSubscript:", 0);
      v24 = (NSString *)objc_claimAutoreleasedReturnValue();
      v25 = NSPointFromString(v24);

      objc_msgSend(v132, "objectAtIndexedSubscript:", 1);
      v26 = (NSString *)objc_claimAutoreleasedReturnValue();
      v27 = NSPointFromString(v26);

      v156 = 0;
      v157 = 0;
      v155 = 0;
      v28 = 0xAAAAAAAAAAAAAAABLL * (((char *)a9->var1 - (char *)a9->var0) >> 3);
      v29 = *(uint64_t **)a9->var0;
      v30 = -1431655765 * ((uint64_t)(*((_QWORD *)a9->var0 + 1) - (_QWORD)v29) >> 3);
      if ((int)v28 < 2)
      {
        std::vector<std::vector<float>>::resize((uint64_t *)&v155, v30);
        if (v30 >= 1)
        {
          v56 = 0;
          v57 = 24 * v30;
          do
          {
            v58 = *(uint64_t **)a9->var0;
            if (v155 != v58)
              std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&v155[v56 / 8], (char *)v58[v56 / 8], v58[v56 / 8 + 1], (v58[v56 / 8 + 1] - v58[v56 / 8]) >> 2);
            v56 += 24;
          }
          while (v57 != v56);
        }
      }
      else
      {
        v32 = *v29;
        v31 = v29[1];
        std::vector<std::vector<float>>::resize((uint64_t *)&v155, v30);
        if (v30 >= 1)
        {
          v33 = 0;
          v34 = (float)(int)v28;
          v139 = v30;
          v141 = (unint64_t)(v31 - v32) >> 2;
          v35 = v28;
          v143 = v28;
          do
          {
            if ((int)v141 >= 1)
            {
              v36 = 0;
              do
              {
                var0 = (uint64_t *)a9->var0;
                v38 = 0.0;
                v39 = v35;
                do
                {
                  v40 = *var0;
                  var0 += 3;
                  v38 = v38 + *(float *)(*(_QWORD *)(v40 + 24 * v33) + 4 * v36);
                  --v39;
                }
                while (v39);
                v41 = &v155[3 * v33];
                v42 = v38 / v34;
                v44 = (float **)(v41 + 1);
                v43 = (float *)v41[1];
                v46 = v41 + 2;
                v45 = v41[2];
                if ((unint64_t)v43 >= v45)
                {
                  v48 = (float *)*v41;
                  v49 = ((uint64_t)v43 - *v41) >> 2;
                  v50 = v49 + 1;
                  if ((unint64_t)(v49 + 1) >> 62)
                    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
                  v51 = v45 - (_QWORD)v48;
                  if (v51 >> 1 > v50)
                    v50 = v51 >> 1;
                  if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFFCLL)
                    v52 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v52 = v50;
                  if (v52)
                  {
                    v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v46, v52);
                    v43 = *v44;
                    v48 = (float *)*v41;
                  }
                  else
                  {
                    v53 = 0;
                  }
                  v54 = (float *)&v53[4 * v49];
                  *v54 = v42;
                  v47 = v54 + 1;
                  while (v43 != v48)
                  {
                    v55 = *((_DWORD *)v43-- - 1);
                    *((_DWORD *)v54-- - 1) = v55;
                  }
                  *v41 = (uint64_t)v54;
                  *v44 = v47;
                  *v46 = &v53[4 * v52];
                  if (v48)
                    operator delete(v48);
                  v35 = v143;
                }
                else
                {
                  *v43 = v42;
                  v47 = v43 + 1;
                }
                *v44 = v47;
                ++v36;
              }
              while (v36 != v141);
            }
            ++v33;
          }
          while (v33 != v139);
        }
      }
      if (v131)
        std::__reverse[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<std::vector<float> *>,std::__wrap_iter<std::vector<float> *>>(v155, v156);
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = 0u;
      v154 = 0u;
      v151 = 0u;
      v152 = 0u;
      objc_msgSend(v133, "subFeatures");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v151, v159, 16);
      if (v60)
      {
        v61 = sqrt((v27.y - v25.y) * (v27.y - v25.y) + (v27.x - v25.x) * (v27.x - v25.x));
        v135 = (v27.y - v25.y) / v61;
        v136 = (v27.x - v25.x) / v61;
        v140 = *(_QWORD *)v152;
        v134 = width * 0.5;
        v62 = v59;
        do
        {
          v144 = v60;
          for (i = 0; i != v144; ++i)
          {
            if (*(_QWORD *)v152 != v140)
              objc_enumerationMutation(v59);
            v64 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * i);
            objc_msgSend(v64, "bounds");
            v66 = v65;
            objc_msgSend(v64, "bounds");
            v68 = v67;
            objc_msgSend(v64, "bounds");
            v70 = v69;
            objc_msgSend(v64, "bounds");
            v72 = 0.0;
            if (v61 > width)
            {
              v73 = (v135 * (v138 * (v70 + v71 * 0.5) - v25.y) + (v137 * (v66 + v68 * 0.5) - v25.x) * v136 - v134)
                  / (v61 - width);
              if (v73 >= 0.0)
              {
                v72 = (v135 * (v138 * (v70 + v71 * 0.5) - v25.y) + (v137 * (v66 + v68 * 0.5) - v25.x) * v136 - v134)
                    / (v61 - width);
                if (v73 > 1.0)
                  v72 = 1.0;
              }
            }
            v75 = v155;
            v74 = v156;
            objc_msgSend(v64, "bounds");
            v77 = v76;
            v78 = 1.0;
            if (x != INFINITY)
              objc_msgSend(v133, "bounds");
            v79 = 0xAAAAAAAAAAAAAAABLL * (v74 - v75);
            v80 = (int)(v72 * (double)(v79 - 1));
            v81 = (int)(v77 * (double)v79 / v78);
            if (v81 <= 1)
              v82 = 1;
            else
              v82 = v81;
            v83 = 0xAAAAAAAAAAAAAAABLL * (v156 - v155);
            v84 = v83 - 1;
            v85 = v83 - 1;
            if (v84 >= (int)(v80 + (v82 >> 1)))
              v86 = v80 + (v82 >> 1);
            else
              v86 = v85;
            v87 = (v155[3 * v80 + 1] - v155[3 * v80]) >> 2;
            v149 = 0;
            std::vector<double>::vector(&__p, v87, &v149);
            objc_msgSend(MEMORY[0x24BDD16A8], "string");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = (v80 - (v82 >> 1)) & ~((int)(v80 - (v82 >> 1)) >> 31);
            if ((int)v90 <= v86)
            {
              do
              {
                v91 = &v155[3 * v90];
                v92 = *v91;
                v93 = v91[1] - *v91;
                if (v93)
                {
                  v94 = 0;
                  v95 = v93 >> 2;
                  if (v95 <= 1)
                    v96 = 1;
                  else
                    v96 = v95;
                  v97 = -1;
                  LODWORD(v89) = -8388608;
                  do
                  {
                    if (a8[v94] != a12 && *(float *)(v92 + 4 * v94) > *(float *)&v89)
                    {
                      LODWORD(v89) = *(_DWORD *)(v92 + 4 * v94);
                      v97 = v94;
                    }
                    ++v94;
                  }
                  while (v96 != v94);
                  if ((v97 & 0x80000000) == 0)
                  {
                    v89 = *(double *)&__p.__begin_[2 * v97] + *(float *)&v89;
                    *(double *)&__p.__begin_[2 * v97] = v89;
                  }
                }
                else
                {
                  v97 = -1;
                }
                LOWORD(v149) = a8[v97];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v149, 1, v89);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "appendString:", v98);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v90);
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v146, "addObject:", v99);

                ++v90;
              }
              while (v90 != v86 + 1);
            }
            if (__p.__begin_ == __p.__end_)
            {
              begin = __p.__begin_;
            }
            else
            {
              v100 = __p.__begin_ + 2;
              begin = __p.__begin_;
              if (__p.__begin_ + 2 != __p.__end_)
              {
                v89 = *(double *)__p.__begin_;
                begin = __p.__begin_;
                v102 = __p.__begin_ + 2;
                do
                {
                  v103 = *(double *)v102;
                  v102 += 2;
                  v104 = v103;
                  if (v89 < v103)
                  {
                    v89 = v104;
                    begin = v100;
                  }
                  v100 = v102;
                }
                while (v102 != __p.__end_);
              }
            }
            LOWORD(v149) = *(const int *)((char *)a8 + (((char *)begin - (char *)__p.__begin_) << 29 >> 30));
            v59 = v62;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v149, 1, v89);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v142, "appendString:", v105);

            if (__p.__begin_)
            {
              __p.__end_ = __p.__begin_;
              operator delete(__p.__begin_);
            }
          }
          v60 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v151, v159, 16);
        }
        while (v60);
      }

      std::vector<int>::vector(&__p, 0xAAAAAAAAAAAAAAABLL * (v156 - v155));
      v106 = v155;
      if (v156 != v155)
      {
        v107 = 0;
        v108 = ((char *)v156 - (char *)v155) / 24;
        v109 = __p.__begin_;
        if (v108 <= 1)
          v108 = 1;
        do
        {
          v110 = &v106[3 * v107];
          v111 = (float *)*v110;
          v112 = (float *)v110[1];
          v113 = v111 + 1;
          v114 = v111 == v112 || v113 == v112;
          v115 = v111;
          if (!v114)
          {
            v116 = *v111;
            v115 = v111;
            v117 = v111 + 1;
            do
            {
              v118 = *v117++;
              v119 = v118;
              if (v116 < v118)
              {
                v116 = v119;
                v115 = v113;
              }
              v113 = v117;
            }
            while (v117 != v112);
          }
          v109[v107++] = *(const int *)((char *)a8 + (((char *)v115 - (char *)v111) << 30 >> 30));
        }
        while (v107 != v108);
      }
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = __p.__begin_;
      if (__p.__end_ != __p.__begin_)
      {
        v122 = 0;
        do
        {
          LOWORD(v149) = v121[v122];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v149, 1);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "appendString:", v123);

          ++v122;
          v121 = __p.__begin_;
        }
        while (v122 < __p.__end_ - __p.__begin_);
      }
      +[GeometricCutTools stringByInjectingSpaces:textFeatures:improved:](GeometricCutTools, "stringByInjectingSpaces:textFeatures:improved:", v142, v133, 1);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = v124;
      if (v131)
      {
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", objc_msgSend(v124, "length"));
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = objc_msgSend(v125, "length");
        v147[0] = MEMORY[0x24BDAC760];
        v147[1] = 3221225472;
        v147[2] = __177__GeometricCutTools_geometricRecognitionOf_inDerotatedRegion_withPadding_fromCorrectedBoundingBox_inImageWithSize_withCodeMap_activations_invert_networkInputSize_garbageSymbol___block_invoke;
        v147[3] = &unk_24C58B4A8;
        v128 = v126;
        v148 = v128;
        objc_msgSend(v125, "enumerateSubstringsInRange:options:usingBlock:", 0, v127, 258, v147);
        v129 = v128;

      }
      else
      {
        v129 = v124;
      }
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v129, v146, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (__p.__begin_)
      {
        __p.__end_ = __p.__begin_;
        operator delete(__p.__begin_);
      }

      __p.__begin_ = (std::vector<int>::pointer)&v155;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    }
    else
    {
      v23 = 0;
    }
    v22 = v132;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

uint64_t __177__GeometricCutTools_geometricRecognitionOf_inDerotatedRegion_withPadding_fromCorrectedBoundingBox_inImageWithSize_withCodeMap_activations_invert_networkInputSize_garbageSymbol___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

@end
