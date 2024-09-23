@implementation UnitsInfo

- (void)populateSubunitIDs:(id)a3 forUnit:(id)a4 visited:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "unitID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "containsObject:", v11) & 1) == 0)
  {
    objc_msgSend(v10, "addObject:", v11);
    objc_msgSend(v9, "allSubunitIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v11);

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v8, "subunitIDs", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          -[UnitsInfo infoForUnitID:](self, "infoForUnitID:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17), "intValue"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[UnitsInfo populateSubunitIDs:forUnit:visited:](self, "populateSubunitIDs:forUnit:visited:", v18, v9, v10);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

  }
}

- (UnitsInfo)initWithDictionary:(id)a3
{
  id v4;
  UnitsInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  const __CFString *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  void *v69;
  void *v70;
  int v71;
  uint64_t v72;
  unint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  _DWORD *v78;
  void *v79;
  void *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  UnitsInfo *v100;
  void *v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t j;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t k;
  uint64_t v120;
  NSArray *unitNames;
  void *v122;
  UnitsInfo *v123;
  id v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  id v131;
  uint64_t v132;
  void *v133;
  unsigned int v134;
  uint64_t v135;
  void *v136;
  id v137;
  id v138;
  id obj;
  id obja;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  void *v144;
  id v145;
  uint64_t v146;
  void *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
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
  _OWORD v164[8];
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
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
  objc_super v189;
  _BYTE v190[128];
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  uint64_t v197;

  v197 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v189.receiver = self;
  v189.super_class = (Class)UnitsInfo;
  v5 = -[UnitsInfo init](&v189, sel_init);
  if (!v5)
    goto LABEL_123;
  v6 = (void *)objc_opt_new();
  -[UnitsInfo setUnitNameToInfo:](v5, "setUnitNameToInfo:", v6);

  v7 = (void *)objc_opt_new();
  -[UnitsInfo setUnitIDToInfo:](v5, "setUnitIDToInfo:", v7);

  v8 = (void *)objc_opt_new();
  -[UnitsInfo setUnitTypeNameToInfo:](v5, "setUnitTypeNameToInfo:", v8);

  v9 = (void *)objc_opt_new();
  -[UnitsInfo setUnitTypeToInfo:](v5, "setUnitTypeToInfo:", v9);

  -[UnitsInfo unitIDToInfo](v5, "unitIDToInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v10, "addObject:", v11);

  -[UnitsInfo unitTypeToInfo](v5, "unitTypeToInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  objc_msgSend(v12, "addObject:", v13);

  v133 = (void *)objc_opt_new();
  v185 = 0u;
  v186 = 0u;
  v187 = 0u;
  v188 = 0u;
  v125 = v4;
  obj = v4;
  v14 = 0x1ED55F000;
  v137 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v185, v196, 16);
  if (!v137)
  {
    v134 = 0;
    goto LABEL_63;
  }
  v134 = 0;
  v135 = *(_QWORD *)v186;
  v15 = CFSTR("BaseNumerator");
  v16 = CFSTR("BaseDenominator");
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v186 != v135)
        objc_enumerationMutation(obj);
      v141 = v17;
      v18 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * v17);
      objc_msgSend(obj, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_opt_new();
      objc_msgSend(v20, "setUnitType:", ++v134);
      objc_msgSend(v20, "setName:", v18);
      objc_msgSend(v20, "setDecompositionCoefficient:", 1, 0x3040000000000000);
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("BaseDecomposition"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setIsDecomposable:", v21 != 0);

      if (objc_msgSend(v18, "isEqualToString:", CFSTR("Temperature")))
      {
        objc_msgSend(v20, "setIsTemperature:", 1);
      }
      else if (objc_msgSend(v18, "isEqualToString:", CFSTR("Currency")))
      {
        objc_msgSend(v20, "setIsCurrency:", 1);
      }
      else if (objc_msgSend(v18, "isEqualToString:", CFSTR("Volume")))
      {
        objc_msgSend(v20, "setIsVolume:", 1);
      }
      if (objc_msgSend(v18, "isEqualToString:", CFSTR("Angle")))
        -[UnitsInfo setAngleInfo:](v5, "setAngleInfo:", v20);
      -[UnitsInfo unitTypeNameToInfo](v5, "unitTypeNameToInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, v18);

      -[UnitsInfo unitTypeToInfo](v5, "unitTypeToInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v20);

      v147 = (void *)objc_opt_new();
      objc_msgSend(v20, "setUnits:");
      v183 = 0u;
      v184 = 0u;
      v181 = 0u;
      v182 = 0u;
      v24 = v19;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v181, v195, 16);
      v14 = 0x1ED55F000uLL;
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v182;
        v143 = *(_QWORD *)v182;
        v145 = v24;
        do
        {
          v28 = 0;
          v149 = v26;
          do
          {
            if (*(_QWORD *)v182 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * v28);
            if ((objc_msgSend((id)(v14 + 2776), "shouldSkipUnitName:", v29) & 1) == 0)
            {
              objc_msgSend(v24, "objectForKeyedSubscript:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[UnitsInfo unitIDToInfo](v5, "unitIDToInfo");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "count");

              v33 = (void *)objc_opt_new();
              objc_msgSend(v33, "setUnitID:", v32);
              objc_msgSend(v33, "setUnitType:", v134);
              objc_msgSend(v33, "setName:", v29);
              objc_msgSend(v33, "setTypeInfo:", v20);
              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("Inverted"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setIsInverted:", objc_msgSend(v34, "BOOLValue"));

              if ((objc_msgSend(v20, "isDecomposable") & 1) != 0)
              {
                objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("IsDisplayName"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "setIsDisplayName:", objc_msgSend(v35, "BOOLValue"));

              }
              else
              {
                objc_msgSend(v33, "setIsDisplayName:", 0);
              }
              if ((objc_msgSend(v33, "isDisplayName") & 1) != 0)
              {
                objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ImpliesDivision"));
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "setImpliesDivision:", objc_msgSend(v36, "BOOLValue"));

              }
              else
              {
                objc_msgSend(v33, "setImpliesDivision:", 0);
              }
              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("DoNotSuggest"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setDoNotSuggest:", objc_msgSend(v37, "BOOLValue"));

              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("FormatNextSmallest"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setFormatNextSmallest:", objc_msgSend(v38, "BOOLValue"));

              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("PreferredUnit"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setIsPreferredUnit:", objc_msgSend(v39, "BOOLValue"));

              objc_msgSend(v33, "setMeasurementSystem:", 0);
              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("MeasurementSystem"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = v40;
              if (v40)
              {
                if ((objc_msgSend(v40, "isEqualToString:", CFSTR("Metric")) & 1) != 0)
                {
                  v42 = 1;
                  goto LABEL_34;
                }
                if ((objc_msgSend(v41, "isEqualToString:", CFSTR("US")) & 1) != 0)
                {
                  v42 = 2;
                  goto LABEL_34;
                }
                if (objc_msgSend(v41, "isEqualToString:", CFSTR("UK")))
                {
                  v42 = 3;
LABEL_34:
                  objc_msgSend(v33, "setMeasurementSystem:", v42);
                }
              }
              if (objc_msgSend(v20, "isTemperature"))
              {
                if (objc_msgSend(v29, "isEqualToString:", CFSTR("fahrenheit")))
                {
                  objc_msgSend(v33, "setIsFahrenheit:", 1);
                }
                else if (objc_msgSend(v29, "isEqualToString:", CFSTR("celsius")))
                {
                  objc_msgSend(v33, "setIsCelsius:", 1);
                }
                else if (objc_msgSend(v29, "isEqualToString:", CFSTR("kelvin")))
                {
                  objc_msgSend(v33, "setIsKelvin:", 1);
                }
              }
              v43 = v16;
              if (objc_msgSend(v29, "isEqualToString:", CFSTR("degree")))
                -[UnitsInfo setDegreesInfo:](v5, "setDegreesInfo:", v33);
              v44 = v15;
              if (objc_msgSend(v29, "isEqualToString:", CFSTR("radian")))
                -[UnitsInfo setRadiansInfo:](v5, "setRadiansInfo:", v33);
              -[UnitsInfo unitNameToInfo](v5, "unitNameToInfo");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "setObject:forKeyedSubscript:", v33, v29);

              -[UnitsInfo unitIDToInfo](v5, "unitIDToInfo");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "addObject:", v33);

              objc_msgSend(v147, "addObject:", v33);
              objc_msgSend(v133, "addObject:", v29);
              LODWORD(v169) = 0;
              v15 = v44;
              objc_msgSend(v30, "objectForKeyedSubscript:", v44);
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              if (v47)
              {
                objc_msgSend(v30, "objectForKeyedSubscript:", v44);
                v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v49 = __bid128_from_string((unsigned __int8 *)objc_msgSend(v48, "UTF8String"), 4, &v169);
                objc_msgSend(v33, "setBaseNumerator:", v49, v50);

              }
              v16 = v43;
              objc_msgSend(v30, "objectForKeyedSubscript:", v43);
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              if (v51)
              {
                objc_msgSend(v30, "objectForKeyedSubscript:", v43);
                v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v53 = __bid128_from_string((unsigned __int8 *)objc_msgSend(v52, "UTF8String"), 4, &v169);
                objc_msgSend(v33, "setBaseDenominator:", v53, v54);

              }
              objc_msgSend(v20, "baseUnit");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v143;
              if (v55
                || (v56 = objc_msgSend(v33, "baseNumerator"),
                    !__bid128_quiet_equal(v56, v57, 1uLL, 0x3040000000000000uLL, &v169)))
              {

              }
              else
              {
                v58 = objc_msgSend(v33, "baseDenominator");
                if (__bid128_quiet_equal(v58, v59, 1uLL, 0x3040000000000000uLL, &v169))
                {
                  objc_msgSend(v33, "setIsBaseUnit:", 1);
                  objc_msgSend(v20, "setBaseUnit:", v33);
                }
              }

              v14 = 0x1ED55F000;
              v24 = v145;
              v26 = v149;
            }
            ++v28;
          }
          while (v26 != v28);
          v60 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v181, v195, 16);
          v26 = v60;
        }
        while (v60);
      }

      v17 = v141 + 1;
    }
    while ((id)(v141 + 1) != v137);
    v137 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v185, v196, 16);
  }
  while (v137);
LABEL_63:

  v179 = 0u;
  v180 = 0u;
  v177 = 0u;
  v178 = 0u;
  v128 = obj;
  v127 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v177, v194, 16);
  if (v127)
  {
    v126 = *(_QWORD *)v178;
    do
    {
      v61 = 0;
      do
      {
        if (*(_QWORD *)v178 != v126)
        {
          v62 = v61;
          objc_enumerationMutation(v128);
          v61 = v62;
        }
        v129 = v61;
        v63 = *(_QWORD *)(*((_QWORD *)&v177 + 1) + 8 * v61);
        objc_msgSend(v128, "objectForKeyedSubscript:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("BaseDecomposition"));
        v138 = (id)objc_claimAutoreleasedReturnValue();
        if (v138)
        {
          v150 = v64;
          v175 = 0u;
          v176 = 0u;
          v173 = 0u;
          v174 = 0u;
          v171 = 0u;
          v172 = 0u;
          v169 = 0u;
          v170 = 0u;
          v165 = 0u;
          v166 = 0u;
          v167 = 0u;
          v168 = 0u;
          v65 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v165, v193, 16);
          if (v65)
          {
            v66 = v65;
            v67 = *(_QWORD *)v166;
            do
            {
              for (i = 0; i != v66; ++i)
              {
                if (*(_QWORD *)v166 != v67)
                  objc_enumerationMutation(v138);
                v69 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * i);
                objc_msgSend(v138, "objectForKeyedSubscript:", v69);
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v69, "isEqualToString:", CFSTR("Coefficient")))
                {
                  v71 = objc_msgSend(v70, "intValue");
                  if (v71 >= 0)
                    v72 = v71;
                  else
                    v72 = -v71;
                  if (v71 < 0)
                    v73 = 0xB040000000000000;
                  else
                    v73 = 0x3040000000000000;
                  -[UnitsInfo unitTypeNameToInfo](v5, "unitTypeNameToInfo");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "objectForKeyedSubscript:", v63);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v75, "setDecompositionCoefficient:", v72, v73);

                }
                else
                {
                  -[UnitsInfo unitNameToInfo](v5, "unitNameToInfo");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v76, "objectForKeyedSubscript:", v69);
                  v74 = (void *)objc_claimAutoreleasedReturnValue();

                  v77 = v67;
                  v78 = (_DWORD *)&v169 + 2 * (int)objc_msgSend(v74, "unitType");
                  *v78 = objc_msgSend(v74, "unitID");
                  v78[1] = objc_msgSend(v70, "intValue");
                  v67 = v77;
                }

              }
              v66 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v165, v193, 16);
            }
            while (v66);
          }
          -[UnitsInfo unitTypeNameToInfo](v5, "unitTypeNameToInfo");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "objectForKeyedSubscript:", v63);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v164[4] = v173;
          v164[5] = v174;
          v164[6] = v175;
          v164[7] = v176;
          v164[0] = v169;
          v164[1] = v170;
          v164[2] = v171;
          v164[3] = v172;
          objc_msgSend(v80, "setDecomposition:", v164);

          v14 = 0x1ED55F000uLL;
          v64 = v150;
        }
        v162 = 0u;
        v163 = 0u;
        v160 = 0u;
        v161 = 0u;
        v81 = v64;
        v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v160, v192, 16);
        if (v82)
        {
          v83 = v82;
          v84 = *(_QWORD *)v161;
          v130 = *(_QWORD *)v161;
          v131 = v81;
          do
          {
            v85 = 0;
            v132 = v83;
            do
            {
              if (*(_QWORD *)v161 != v84)
                objc_enumerationMutation(v81);
              v86 = *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * v85);
              if ((objc_msgSend((id)(v14 + 2776), "shouldSkipUnitName:", v86) & 1) == 0)
              {
                objc_msgSend(v81, "objectForKeyedSubscript:", v86);
                v148 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("BestEquivalent"));
                v87 = objc_claimAutoreleasedReturnValue();
                v144 = (void *)v87;
                v146 = v85;
                if (v87)
                {
                  v88 = v87;
                  -[UnitsInfo unitNameToInfo](v5, "unitNameToInfo");
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v89, "objectForKeyedSubscript:", v88);
                  v90 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v90 = 0;
                }
                -[UnitsInfo unitNameToInfo](v5, "unitNameToInfo");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "objectForKeyedSubscript:", v86);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "setBestEquivalent:", v90);

                objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("NextSmallest"));
                v93 = objc_claimAutoreleasedReturnValue();
                v142 = (void *)v93;
                if (v93)
                {
                  v94 = v93;
                  -[UnitsInfo unitNameToInfo](v5, "unitNameToInfo");
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v95, "objectForKeyedSubscript:", v94);
                  v96 = objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v96 = 0;
                }
                -[UnitsInfo unitNameToInfo](v5, "unitNameToInfo");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "objectForKeyedSubscript:", v86);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                obja = (id)v96;
                objc_msgSend(v98, "setNextSmallest:", v96);

                objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("Subunits"));
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                if (v99)
                {
                  v151 = v86;
                  v100 = v5;
                  v101 = (void *)objc_opt_new();
                  v156 = 0u;
                  v157 = 0u;
                  v158 = 0u;
                  v159 = 0u;
                  v136 = v99;
                  v102 = v99;
                  v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v156, v191, 16);
                  if (v103)
                  {
                    v104 = v103;
                    v105 = *(_QWORD *)v157;
                    do
                    {
                      for (j = 0; j != v104; ++j)
                      {
                        v107 = v90;
                        if (*(_QWORD *)v157 != v105)
                          objc_enumerationMutation(v102);
                        v108 = *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * j);
                        -[UnitsInfo unitNameToInfo](v100, "unitNameToInfo");
                        v109 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v109, "objectForKeyedSubscript:", v108);
                        v110 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v110)
                        {
                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v110, "unitID"));
                          v111 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v101, "addObject:", v111);

                        }
                        else
                        {
                          NSLog(CFSTR("Warning: Unit type not found for subunit of %@ (%@). Please audit the Subunits section of the units dictionary.\n"), v151, v108);
                        }
                        v90 = v107;

                      }
                      v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v156, v191, 16);
                    }
                    while (v104);
                  }

                  v5 = v100;
                  -[UnitsInfo unitNameToInfo](v100, "unitNameToInfo");
                  v112 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v112, "objectForKeyedSubscript:", v151);
                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v113, "setSubunitIDs:", v101);

                  v14 = 0x1ED55F000;
                  v84 = v130;
                  v81 = v131;
                  v83 = v132;
                  v99 = v136;
                }

                v85 = v146;
              }
              ++v85;
            }
            while (v85 != v83);
            v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v160, v192, 16);
          }
          while (v83);
        }

        v61 = v129 + 1;
      }
      while (v129 + 1 != v127);
      v127 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v177, v194, 16);
    }
    while (v127);
  }

  v114 = (void *)objc_opt_new();
  v152 = 0u;
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  -[UnitsInfo unitIDToInfo](v5, "unitIDToInfo");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v152, v190, 16);
  if (v116)
  {
    v117 = v116;
    v118 = *(_QWORD *)v153;
    do
    {
      for (k = 0; k != v117; ++k)
      {
        if (*(_QWORD *)v153 != v118)
          objc_enumerationMutation(v115);
        -[UnitsInfo populateSubunitIDs:forUnit:visited:](v5, "populateSubunitIDs:forUnit:visited:", *(_QWORD *)(*((_QWORD *)&v152 + 1) + 8 * k), *(_QWORD *)(*((_QWORD *)&v152 + 1) + 8 * k), v114);
        objc_msgSend(v114, "removeAllObjects");
      }
      v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v152, v190, 16);
    }
    while (v117);
  }

  v120 = objc_msgSend(v133, "copy");
  unitNames = v5->_unitNames;
  v5->_unitNames = (NSArray *)v120;

  v5->_unitTypeCount = v134;
  -[UnitsInfo unitIDToInfo](v5, "unitIDToInfo");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_unitCount = objc_msgSend(v122, "count");

  v123 = v5;
  v4 = v125;
LABEL_123:

  return v5;
}

- (id)infoForUnitType:(int)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  if (a3 < 1
    || (-[UnitsInfo unitTypeToInfo](self, "unitTypeToInfo"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 <= a3))
  {
    v8 = 0;
  }
  else
  {
    -[UnitsInfo unitTypeToInfo](self, "unitTypeToInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)infoForUnitTypeName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UnitsInfo unitTypeNameToInfo](self, "unitTypeNameToInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)infoForUnitID:(int)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  if (a3 < 0
    || (-[UnitsInfo unitIDToInfo](self, "unitIDToInfo"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 <= a3))
  {
    v8 = 0;
  }
  else
  {
    -[UnitsInfo unitIDToInfo](self, "unitIDToInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)infoForUnitName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UnitsInfo unitNameToInfo](self, "unitNameToInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)unitNames
{
  return self->_unitNames;
}

- (int)unitCount
{
  return self->_unitCount;
}

- (int)unitTypeCount
{
  return self->_unitTypeCount;
}

- (NSMutableDictionary)unitNameToInfo
{
  return self->_unitNameToInfo;
}

- (void)setUnitNameToInfo:(id)a3
{
  objc_storeStrong((id *)&self->_unitNameToInfo, a3);
}

- (NSMutableArray)unitIDToInfo
{
  return self->_unitIDToInfo;
}

- (void)setUnitIDToInfo:(id)a3
{
  objc_storeStrong((id *)&self->_unitIDToInfo, a3);
}

- (NSMutableDictionary)unitTypeNameToInfo
{
  return self->_unitTypeNameToInfo;
}

- (void)setUnitTypeNameToInfo:(id)a3
{
  objc_storeStrong((id *)&self->_unitTypeNameToInfo, a3);
}

- (NSMutableArray)unitTypeToInfo
{
  return self->_unitTypeToInfo;
}

- (void)setUnitTypeToInfo:(id)a3
{
  objc_storeStrong((id *)&self->_unitTypeToInfo, a3);
}

- (UnitTypeInfo)angleInfo
{
  return (UnitTypeInfo *)objc_loadWeakRetained((id *)&self->_angleInfo);
}

- (void)setAngleInfo:(id)a3
{
  objc_storeWeak((id *)&self->_angleInfo, a3);
}

- (UnitInfo)degreesInfo
{
  return (UnitInfo *)objc_loadWeakRetained((id *)&self->_degreesInfo);
}

- (void)setDegreesInfo:(id)a3
{
  objc_storeWeak((id *)&self->_degreesInfo, a3);
}

- (UnitInfo)radiansInfo
{
  return (UnitInfo *)objc_loadWeakRetained((id *)&self->_radiansInfo);
}

- (void)setRadiansInfo:(id)a3
{
  objc_storeWeak((id *)&self->_radiansInfo, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_radiansInfo);
  objc_destroyWeak((id *)&self->_degreesInfo);
  objc_destroyWeak((id *)&self->_angleInfo);
  objc_storeStrong((id *)&self->_unitTypeToInfo, 0);
  objc_storeStrong((id *)&self->_unitTypeNameToInfo, 0);
  objc_storeStrong((id *)&self->_unitIDToInfo, 0);
  objc_storeStrong((id *)&self->_unitNameToInfo, 0);
  objc_storeStrong((id *)&self->_unitNames, 0);
}

+ (UnitsInfo)converterUnits
{
  if (converterUnits_loadUnitDictionaryOnce[0] != -1)
    dispatch_once(converterUnits_loadUnitDictionaryOnce, &__block_literal_global_320);
  return (UnitsInfo *)(id)converterUnits_unitsInfo;
}

+ (BOOL)shouldSkipUnitName:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("BaseDecomposition"));
}

+ (UnitsInfo)unitsInfoWithDictionary:(id)a3
{
  id v3;
  UnitsInfo *v4;

  v3 = a3;
  v4 = -[UnitsInfo initWithDictionary:]([UnitsInfo alloc], "initWithDictionary:", v3);

  return v4;
}

void __27__UnitsInfo_converterUnits__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("ConverterUnits"), CFSTR("plist"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v4);
  +[UnitsInfo unitsInfoWithDictionary:](UnitsInfo, "unitsInfoWithDictionary:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)converterUnits_unitsInfo;
  converterUnits_unitsInfo = v2;

}

@end
