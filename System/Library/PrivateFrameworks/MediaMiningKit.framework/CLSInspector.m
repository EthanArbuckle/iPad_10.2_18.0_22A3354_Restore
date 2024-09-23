@implementation CLSInspector

- (CLSInspector)init
{
  CLSInspector *v2;
  CLSInspector *v3;
  NSArray *profileClasses;
  uint64_t v5;
  NSMutableDictionary *profileClassesByIdentifier;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  uint64_t v15;
  NSArray *informantClasses;
  uint64_t v17;
  NSMutableDictionary *informantClassesByIdentifier;
  uint64_t v19;
  NSMutableDictionary *informantClassesByFamilyIdentifier;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  NSMutableDictionary *v27;
  void *v28;
  NSMutableDictionary *v29;
  void *v30;
  void *v31;
  NSMutableDictionary *v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  _QWORD v45[4];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v43.receiver = self;
  v43.super_class = (Class)CLSInspector;
  v2 = -[CLSInspector init](&v43, sel_init);
  v3 = v2;
  if (v2)
  {
    profileClasses = v2->_profileClasses;
    v2->_profileClasses = (NSArray *)MEMORY[0x1E0C9AA60];

    v5 = objc_opt_new();
    profileClassesByIdentifier = v3->_profileClassesByIdentifier;
    v3->_profileClassesByIdentifier = (NSMutableDictionary *)v5;

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v7 = v3->_profileClasses;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v13 = v3->_profileClassesByIdentifier;
          objc_msgSend(v12, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v12, v14);

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v9);
    }

    v45[0] = objc_opt_class();
    v45[1] = objc_opt_class();
    v45[2] = objc_opt_class();
    v45[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
    v15 = objc_claimAutoreleasedReturnValue();
    informantClasses = v3->_informantClasses;
    v3->_informantClasses = (NSArray *)v15;

    v17 = objc_opt_new();
    informantClassesByIdentifier = v3->_informantClassesByIdentifier;
    v3->_informantClassesByIdentifier = (NSMutableDictionary *)v17;

    v19 = objc_opt_new();
    informantClassesByFamilyIdentifier = v3->_informantClassesByFamilyIdentifier;
    v3->_informantClassesByFamilyIdentifier = (NSMutableDictionary *)v19;

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v21 = v3->_informantClasses;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v36 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          v27 = v3->_informantClassesByIdentifier;
          objc_msgSend(v26, "identifier", (_QWORD)v35);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v26, v28);

          v29 = v3->_informantClassesByFamilyIdentifier;
          objc_msgSend(v26, "familyIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](v29, "objectForKey:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31)
          {
            v31 = (void *)objc_opt_new();
            v32 = v3->_informantClassesByFamilyIdentifier;
            objc_msgSend(v26, "familyIdentifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v32, "setObject:forKey:", v31, v33);

          }
          objc_msgSend(v31, "addObject:", v26);

        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      }
      while (v23);
    }

  }
  return v3;
}

- (Class)informantClassForIdentifier:(id)a3
{
  return (Class)-[NSMutableDictionary objectForKey:](self->_informantClassesByIdentifier, "objectForKey:", a3);
}

- (id)informantClassesForFamilyIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_informantClassesByFamilyIdentifier, "objectForKey:", a3);
}

- (id)informantClassesForAnyIdentifier:(id)a3
{
  id v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CLSInspector informantClassForIdentifier:](self, "informantClassForIdentifier:", v4);
  if (v5)
  {
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CLSInspector informantClassesForFamilyIdentifier:](self, "informantClassesForFamilyIdentifier:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (Class)profileClassForIdentifier:(id)a3
{
  return (Class)-[NSMutableDictionary objectForKey:](self->_profileClassesByIdentifier, "objectForKey:", a3);
}

- (id)profileIdentifierForHash:(unint64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_profileClasses;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "valueForKey:", CFSTR("identifier"), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "hash") == a3)
        {
          v11 = v10;

          v7 = v11;
        }

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)performInvestigation:(id)a3
{
  -[CLSInspector performInvestigation:options:progressBlock:](self, "performInvestigation:options:progressBlock:", a3, 7, &__block_literal_global_383);
}

- (void)performInvestigation:(id)a3 progressBlock:(id)a4
{
  -[CLSInspector performInvestigation:options:progressBlock:](self, "performInvestigation:options:progressBlock:", a3, 7, a4);
}

- (void)performInvestigation:(id)a3 options:(unint64_t)a4 progressBlock:(id)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int v19;
  objc_class *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  char v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t n;
  objc_class *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  NSObject *v74;
  char v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t kk;
  void *v81;
  void *v82;
  _BOOL4 v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void (**v90)(_QWORD, _QWORD, double);
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t ii;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t jj;
  void *v102;
  char v103;
  id *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  char v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  id obj;
  uint64_t v126;
  uint64_t v127;
  void *v129;
  id v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  objc_class *v136;
  void *v137;
  id v138;
  void *v139;
  void (**v140)(_QWORD, _QWORD, double);
  id v141;
  id v142;
  id v143;
  id v144;
  _QWORD v145[4];
  void (**v146)(_QWORD, _QWORD, double);
  uint64_t *v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  _QWORD v156[4];
  void (**v157)(_QWORD, _QWORD, double);
  uint64_t *v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  _QWORD v163[4];
  void (**v164)(_QWORD, _QWORD, double);
  uint64_t *v165;
  _QWORD v166[4];
  id v167[2];
  _QWORD v168[4];
  _QWORD v169[2];
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  char v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  uint64_t v207;
  uint64_t *v208;
  uint64_t v209;
  char v210;
  _BYTE v211[128];
  _BYTE v212[128];
  _BYTE v213[128];
  _BYTE v214[128];
  _BYTE v215[128];
  _BYTE v216[128];
  _BYTE v217[128];
  _BYTE v218[128];
  uint8_t v219[128];
  uint8_t buf[4];
  void *v221;
  __int16 v222;
  objc_class *v223;
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  uint64_t v227;

  v121 = a4;
  v227 = *MEMORY[0x1E0C80C00];
  v141 = a3;
  v124 = a5;
  v140 = (void (**)(_QWORD, _QWORD, double))MEMORY[0x1D1796244]();
  v207 = 0;
  v208 = &v207;
  v209 = 0x2020000000;
  v210 = 0;
  v129 = (void *)objc_opt_new();
  v133 = (void *)objc_opt_new();
  v139 = (void *)objc_opt_new();
  v132 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v137 = (void *)objc_opt_new();
  v134 = (void *)objc_opt_new();
  v206 = 0u;
  v205 = 0u;
  v204 = 0u;
  v203 = 0u;
  objc_msgSend(v141, "profiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v203, v226, 16);
  obj = v7;
  if (v8)
  {
    v122 = *(_QWORD *)v204;
    do
    {
      v123 = 0;
      v120 = v8;
      do
      {
        if (*(_QWORD *)v204 != v122)
          objc_enumerationMutation(obj);
        v126 = *(_QWORD *)(*((_QWORD *)&v203 + 1) + 8 * v123);
        objc_msgSend(v137, "addObject:");
        objc_msgSend((id)objc_opt_class(), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "setObject:forKey:", v126, v9);

        v202 = 0u;
        v201 = 0u;
        v200 = 0u;
        v199 = 0u;
        objc_msgSend((id)objc_opt_class(), "profileDependenciesIdentifiers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v199, v225, 16);
        if (!v11)
          goto LABEL_29;
        v135 = *(_QWORD *)v200;
        v138 = v10;
        while (2)
        {
          v142 = 0;
          v130 = (id)v11;
          do
          {
            if (*(_QWORD *)v200 != v135)
              objc_enumerationMutation(v10);
            v12 = *(objc_class **)(*((_QWORD *)&v199 + 1) + 8 * (_QWORD)v142);
            v195 = 0u;
            v196 = 0u;
            v197 = 0u;
            v198 = 0u;
            objc_msgSend(v141, "profiles");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v195, v224, 16);
            if (v14)
            {
              v15 = 0;
              v16 = *(_QWORD *)v196;
              do
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v196 != v16)
                    objc_enumerationMutation(v13);
                  objc_msgSend((id)objc_opt_class(), "identifier");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_msgSend(v18, "isEqualToString:", v12);

                  if (v19)
                  {
                    objc_msgSend(v6, "addObject:", objc_opt_class());
                    v15 = 1;
                  }
                }
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v195, v224, 16);
              }
              while (v14);

              if ((v15 & 1) != 0)
                goto LABEL_27;
            }
            else
            {

            }
            v20 = -[CLSInspector profileClassForIdentifier:](self, "profileClassForIdentifier:", v12);
            if (!v20 || !-[objc_class isSubclassOfClass:](v20, "isSubclassOfClass:", objc_opt_class()))
            {
              +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "loggingConnection");
              v29 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v141, "uuid");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v221 = v53;
                v222 = 2112;
                v223 = v12;
                _os_log_error_impl(&dword_1CAB79000, v29, OS_LOG_TYPE_ERROR, "Investigation \"%@\" cannot be performed: \"Profile dependency \"%@\" cannot be found or is incompatible\", buf, 0x16u);

              }
              goto LABEL_107;
            }
            objc_msgSend(v6, "addObject:", v20);
            v21 = objc_alloc_init(v20);
            if (!v21)
            {
              +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "loggingConnection");
              v29 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v141, "uuid");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v221 = v71;
                v222 = 2112;
                v223 = v20;
                _os_log_error_impl(&dword_1CAB79000, v29, OS_LOG_TYPE_ERROR, "Investigation \"%@\" cannot be performed: \"Profile \"%@\" cannot be instantiated\", buf, 0x16u);

              }
              goto LABEL_107;
            }
            objc_msgSend(v137, "addObject:", v21);
            objc_msgSend((id)objc_opt_class(), "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v134, "setObject:forKey:", v21, v22);

LABEL_27:
            v142 = (char *)v142 + 1;
            v10 = v138;
          }
          while (v142 != v130);
          v11 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v199, v225, 16);
          if (v11)
            continue;
          break;
        }
LABEL_29:

        v193 = 0u;
        v194 = 0u;
        v191 = 0u;
        v192 = 0u;
        objc_msgSend((id)objc_opt_class(), "informantDependenciesIdentifiers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v191, v219, 16);
        if (v24)
        {
          v25 = *(_QWORD *)v192;
          v138 = v23;
LABEL_31:
          v26 = 0;
          while (1)
          {
            if (*(_QWORD *)v192 != v25)
              objc_enumerationMutation(v23);
            v27 = *(objc_class **)(*((_QWORD *)&v191 + 1) + 8 * v26);
            -[CLSInspector informantClassesForAnyIdentifier:](self, "informantClassesForAnyIdentifier:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v189 = 0u;
            v190 = 0u;
            v187 = 0u;
            v188 = 0u;
            v29 = v28;
            v30 = -[NSObject countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v187, v218, 16);
            if (!v30)
              break;
            v31 = *(_QWORD *)v188;
            while (2)
            {
              for (j = 0; j != v30; ++j)
              {
                if (*(_QWORD *)v188 != v31)
                  objc_enumerationMutation(v29);
                v33 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * j);
                if (!v33 || !objc_msgSend(v33, "isSubclassOfClass:", objc_opt_class()))
                {
                  +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v65, "loggingConnection");
                  v66 = objc_claimAutoreleasedReturnValue();

                  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v141, "uuid");
                    v105 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v221 = v105;
                    v222 = 2112;
                    v223 = v27;
                    _os_log_error_impl(&dword_1CAB79000, v66, OS_LOG_TYPE_ERROR, "Investigation \"%@\" cannot be performed: \"Informant \"%@\" cannot be found or is incompatible\", buf, 0x16u);

                  }
                  v67 = v29;
                  goto LABEL_97;
                }
                objc_msgSend(v129, "addObject:", v33);
              }
              v30 = -[NSObject countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v187, v218, 16);
              if (v30)
                continue;
              break;
            }

            ++v26;
            v23 = v138;
            if (v26 == v24)
            {
              v24 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v191, v219, 16);
              if (v24)
                goto LABEL_31;
              goto LABEL_45;
            }
          }

          +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "loggingConnection");
          v67 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v141, "uuid");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v221 = v116;
            v222 = 2112;
            v223 = v27;
            _os_log_error_impl(&dword_1CAB79000, v67, OS_LOG_TYPE_ERROR, "Investigation \"%@\" cannot be performed: \"Informant \"%@\" cannot be found or is incompatible\", buf, 0x16u);

          }
LABEL_97:

LABEL_107:
          goto LABEL_108;
        }
LABEL_45:

        v34 = (id)objc_msgSend(v129, "copy");
        v35 = 0;
        while (objc_msgSend(v34, "count"))
        {
          v29 = objc_opt_new();

          v185 = 0u;
          v186 = 0u;
          v183 = 0u;
          v184 = 0u;
          v138 = v34;
          v36 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v183, v217, 16);
          if (v36)
          {
            v37 = *(_QWORD *)v184;
            while (2)
            {
              for (k = 0; k != v36; ++k)
              {
                if (*(_QWORD *)v184 != v37)
                  objc_enumerationMutation(v138);
                v39 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * k);
                v179 = 0u;
                v180 = 0u;
                v181 = 0u;
                v182 = 0u;
                objc_msgSend(v39, "informantDependenciesIdentifiers");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v179, v216, 16);
                v143 = v40;
                if (v41)
                {
                  v42 = *(_QWORD *)v180;
LABEL_54:
                  v43 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v180 != v42)
                      objc_enumerationMutation(v143);
                    v136 = *(objc_class **)(*((_QWORD *)&v179 + 1) + 8 * v43);
                    -[CLSInspector informantClassesForAnyIdentifier:](self, "informantClassesForAnyIdentifier:");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v177 = 0u;
                    v178 = 0u;
                    v175 = 0u;
                    v176 = 0u;
                    v45 = v44;
                    v46 = -[NSObject countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v175, v215, 16);
                    if (!v46)
                      break;
                    v119 = v43;
                    v127 = v42;
                    v131 = v37;
                    v47 = *(_QWORD *)v176;
                    while (2)
                    {
                      for (m = 0; m != v46; ++m)
                      {
                        if (*(_QWORD *)v176 != v47)
                          objc_enumerationMutation(v45);
                        v49 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * m);
                        if (!v49 || !objc_msgSend(v49, "isSubclassOfClass:", objc_opt_class()))
                        {
                          +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
                          v72 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v72, "loggingConnection");
                          v73 = objc_claimAutoreleasedReturnValue();

                          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                          {
                            objc_msgSend(v141, "uuid");
                            v114 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138412546;
                            v221 = v114;
                            v222 = 2112;
                            v223 = v136;
                            _os_log_error_impl(&dword_1CAB79000, v73, OS_LOG_TYPE_ERROR, "Investigation \"%@\" cannot be performed: \"Informant \"%@\" cannot be found or is incompatible\", buf, 0x16u);

                          }
                          v74 = v45;
                          goto LABEL_106;
                        }
                        objc_msgSend(v129, "addObject:", v49);
                        -[NSObject addObject:](v29, "addObject:", v49);
                      }
                      v46 = -[NSObject countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v175, v215, 16);
                      if (v46)
                        continue;
                      break;
                    }

                    v37 = v131;
                    v43 = v119 + 1;
                    v42 = v127;
                    if (v119 + 1 == v41)
                    {
                      v41 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v179, v216, 16);
                      v37 = v131;
                      v42 = v127;
                      if (v41)
                        goto LABEL_54;
                      goto LABEL_68;
                    }
                  }

                  +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v117, "loggingConnection");
                  v74 = objc_claimAutoreleasedReturnValue();

                  if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v141, "uuid");
                    v118 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v221 = v118;
                    v222 = 2112;
                    v223 = v136;
                    _os_log_error_impl(&dword_1CAB79000, v74, OS_LOG_TYPE_ERROR, "Investigation \"%@\" cannot be performed: \"Informant \"%@\" cannot be found or is incompatible\", buf, 0x16u);

                  }
LABEL_106:

                  goto LABEL_107;
                }
LABEL_68:

              }
              v36 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v183, v217, 16);
              if (v36)
                continue;
              break;
            }
          }

          v34 = -[NSObject copy](v29, "copy");
          v35 = v29;
        }

        ++v123;
      }
      while (v123 != v120);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v203, v226, 16);
    }
    while (v8);
  }

  if (v140)
  {
    v174 = 0;
    ((void (**)(_QWORD, char *, double))v140)[2](v140, &v174, 0.1);
    v50 = *((_BYTE *)v208 + 24) | v174;
    *((_BYTE *)v208 + 24) = v50;
    if (v50)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_108;
      *(_DWORD *)buf = 67109120;
      LODWORD(v221) = 307;
      v51 = MEMORY[0x1E0C81028];
LABEL_77:
      _os_log_impl(&dword_1CAB79000, v51, OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      goto LABEL_108;
    }
  }
  v172 = 0u;
  v173 = 0u;
  v170 = 0u;
  v171 = 0u;
  v54 = v129;
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v170, v214, 16);
  if (v55)
  {
    v56 = *(_QWORD *)v171;
    while (2)
    {
      for (n = 0; n != v55; ++n)
      {
        if (*(_QWORD *)v171 != v56)
          objc_enumerationMutation(v54);
        v58 = *(objc_class **)(*((_QWORD *)&v170 + 1) + 8 * n);
        v59 = (void *)objc_opt_new();
        if (!v59)
        {
          +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "loggingConnection");
          v69 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v141, "uuid");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v221 = v106;
            v222 = 2112;
            v223 = v58;
            _os_log_error_impl(&dword_1CAB79000, v69, OS_LOG_TYPE_ERROR, "Investigation \"%@\" cannot be performed: \"Informant \"%@\" cannot be instantiated\", buf, 0x16u);

          }
          goto LABEL_108;
        }
        objc_msgSend(v133, "addObject:", v59);
        objc_msgSend((id)objc_opt_class(), "identifier");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "setObject:forKey:", v59, v60);

        objc_msgSend((id)objc_opt_class(), "familyIdentifier");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "objectForKey:", v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v62)
        {
          v62 = (void *)objc_opt_new();
          objc_msgSend((id)objc_opt_class(), "familyIdentifier");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v139, "setObject:forKey:", v62, v63);

        }
        objc_msgSend(v62, "addObject:", v59);

      }
      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v170, v214, 16);
      if (v55)
        continue;
      break;
    }
  }

  if (v140)
  {
    v174 = 0;
    ((void (**)(_QWORD, char *, double))v140)[2](v140, &v174, 0.2);
    v64 = *((_BYTE *)v208 + 24) | v174;
    *((_BYTE *)v208 + 24) = v64;
    if (v64)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_108;
      *(_DWORD *)buf = 67109120;
      LODWORD(v221) = 333;
      v51 = MEMORY[0x1E0C81028];
      goto LABEL_77;
    }
  }
  objc_msgSend(v141, "_willBeginInvestigation:", self);
  v75 = v121;
  if ((v121 & 1) != 0)
  {
    objc_msgSend(v141, "feeder");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v82 == 0;

    if (v83)
    {
      objc_msgSend(v141, "clueCollection");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v168[0] = MEMORY[0x1E0C809B0];
      v168[1] = 3221225472;
      v168[2] = __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke;
      v168[3] = &unk_1E84F94F0;
      v169[0] = v140;
      v169[1] = &v207;
      objc_msgSend(v91, "prepareWithProgressBlock:", v168);
      v104 = (id *)v169;
    }
    else
    {
      objc_msgSend(v141, "feeder");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "helper");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "serviceManager");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "helper");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "locationCache");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = MEMORY[0x1E0C809B0];
      v166[0] = MEMORY[0x1E0C809B0];
      v166[1] = 3221225472;
      v166[2] = __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke_2;
      v166[3] = &unk_1E84F94F0;
      v90 = v140;
      v167[0] = v90;
      v167[1] = &v207;
      objc_msgSend(v84, "prepareWithServiceManager:locationCache:progressBlock:", v86, v88, v166);
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      if (*((_BYTE *)v208 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v221) = 352;
          _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }

        goto LABEL_108;
      }
      objc_msgSend(v141, "clueCollection");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "inputClues");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "mergeClues:", v108);

      objc_msgSend(v141, "clueCollection");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "outputClues");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "mergeClues:", v110);

      objc_msgSend(v141, "clueCollection");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "meaningClues");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "mergeClues:", v112);

      objc_msgSend(v141, "clueCollection");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v163[0] = v89;
      v163[1] = 3221225472;
      v163[2] = __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke_48;
      v163[3] = &unk_1E84F94F0;
      v164 = v90;
      v165 = &v207;
      objc_msgSend(v113, "prepareWithProgressBlock:", v163);

      v104 = v167;
    }

    v75 = v121;
    if (*((_BYTE *)v208 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_108;
      *(_DWORD *)buf = 67109120;
      LODWORD(v221) = 362;
      v51 = MEMORY[0x1E0C81028];
      goto LABEL_77;
    }
  }
  if ((v75 & 2) != 0)
  {
    v161 = 0u;
    v162 = 0u;
    v159 = 0u;
    v160 = 0u;
    v144 = v133;
    v92 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v159, v213, 16);
    if (v92)
    {
      v93 = *(_QWORD *)v160;
      while (2)
      {
        for (ii = 0; ii != v92; ++ii)
        {
          if (*(_QWORD *)v160 != v93)
            objc_enumerationMutation(v144);
          v95 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * ii);
          v156[0] = MEMORY[0x1E0C809B0];
          v156[1] = 3221225472;
          v156[2] = __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke_49;
          v156[3] = &unk_1E84F94F0;
          v157 = v140;
          v158 = &v207;
          objc_msgSend(v95, "gatherCluesForInvestigation:progressBlock:", v141, v156);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = v96;
          if (*((_BYTE *)v208 + 24))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v221) = 374;
              _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
            }

            goto LABEL_108;
          }
          v154 = 0u;
          v155 = 0u;
          v152 = 0u;
          v153 = 0u;
          v98 = v96;
          v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v152, v212, 16);
          if (v99)
          {
            v100 = *(_QWORD *)v153;
            do
            {
              for (jj = 0; jj != v99; ++jj)
              {
                if (*(_QWORD *)v153 != v100)
                  objc_enumerationMutation(v98);
                objc_msgSend(*(id *)(*((_QWORD *)&v152 + 1) + 8 * jj), "setInformant:", v95);
              }
              v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v152, v212, 16);
            }
            while (v99);
          }

          objc_msgSend(v141, "clueCollection");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "mergeClues:", v98);

        }
        v92 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v159, v213, 16);
        if (v92)
          continue;
        break;
      }
    }

    if (v140)
    {
      v174 = 0;
      ((void (**)(_QWORD, char *, double))v140)[2](v140, &v174, 0.6);
      v103 = *((_BYTE *)v208 + 24) | v174;
      *((_BYTE *)v208 + 24) = v103;
      if (v103)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          goto LABEL_108;
        *(_DWORD *)buf = 67109120;
        LODWORD(v221) = 384;
        v51 = MEMORY[0x1E0C81028];
        goto LABEL_77;
      }
    }
  }
  if ((v121 & 4) != 0)
  {
    v150 = 0u;
    v151 = 0u;
    v148 = 0u;
    v149 = 0u;
    v76 = v137;
    v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v148, v211, 16);
    if (v77)
    {
      v78 = *(_QWORD *)v149;
      v79 = MEMORY[0x1E0C809B0];
      do
      {
        for (kk = 0; kk != v77; ++kk)
        {
          if (*(_QWORD *)v149 != v78)
            objc_enumerationMutation(v76);
          v81 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * kk);
          v145[0] = v79;
          v145[1] = 3221225472;
          v145[2] = __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke_50;
          v145[3] = &unk_1E84F94F0;
          v146 = v140;
          v147 = &v207;
          objc_msgSend(v81, "processResultsSynchronouslyForInvestigation:withProgressBlock:", v141, v145);

        }
        v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v148, v211, 16);
      }
      while (v77);
    }

  }
  if (!*((_BYTE *)v208 + 24))
  {
    objc_msgSend(v141, "_didEndInvestigation:", 1);
    goto LABEL_108;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v221) = 398;
    v51 = MEMORY[0x1E0C81028];
    goto LABEL_77;
  }
LABEL_108:

  _Block_object_dispose(&v207, 8);
}

- (void)invalidateSharedPersistentCachesWithServiceManager:(id)a3 locationCache:(id)a4
{
  CLSInspector *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_sync_exit(obj);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_informantClassesByFamilyIdentifier, 0);
  objc_storeStrong((id *)&self->_informantClassesByIdentifier, 0);
  objc_storeStrong((id *)&self->_informantClasses, 0);
  objc_storeStrong((id *)&self->_profileClassesByIdentifier, 0);
  objc_storeStrong((id *)&self->_profileClasses, 0);
}

uint64_t __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  char v5;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v5 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v5;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

uint64_t __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke_2(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  char v5;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v5 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v5;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

uint64_t __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke_48(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  char v5;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v5 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v5;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

uint64_t __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke_49(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  char v5;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v5 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.6);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v5;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

uint64_t __59__CLSInspector_performInvestigation_options_progressBlock___block_invoke_50(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  char v5;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v5 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.8);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v5;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

@end
